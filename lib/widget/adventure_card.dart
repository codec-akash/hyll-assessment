import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:senior_flutter_challenge_v2/model/adventure_model.dart';
import 'package:senior_flutter_challenge_v2/utils/slide_page_builder.dart';

class AdventureCard extends StatefulWidget {
  final int contentCount;
  final int currentIndex;
  final Duration endDuration;
  final List<Contents> content;
  const AdventureCard({
    super.key,
    required this.content,
    required this.contentCount,
    required this.currentIndex,
    this.endDuration = const Duration(seconds: 5),
  });

  @override
  State<AdventureCard> createState() => _AdventureCardState();
}

class _AdventureCardState extends State<AdventureCard>
    with TickerProviderStateMixin {
  late AnimationController controller;

  Animation<double>? currentAnimation;

  Contents get currentContent => widget.content[widget.currentIndex];

  Contents? get nextContext => widget.currentIndex < widget.content.length - 1
      ? widget.content[widget.currentIndex + 1]
      : null;

  bool get isEndContent => widget.currentIndex == widget.content.length - 1;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.endDuration);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onEnd();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      currentAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
      controller.forward();
    });
    super.initState();
  }

  onEnd() {
    if (nextContext != null) {
      Navigator.of(context).pushReplacement(
        SlidePageBuilder(
          duration: const Duration(milliseconds: 130),
          builder: (context) => AdventureCard(
            contentCount: widget.contentCount,
            currentIndex: widget.currentIndex + 1,
            content: widget.content,
          ),
        ),
      );
    } else {}
  }

  onPrevious() {
    if (widget.currentIndex > 0) {
      Navigator.of(context).pushReplacement(
        SlidePageBuilder(
          opposite: true,
          builder: (context) => AdventureCard(
            contentCount: widget.contentCount,
            currentIndex: widget.currentIndex - 1,
            content: widget.content,
          ),
        ),
      );
    }
  }

  Widget buildBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: GestureDetector(
          onLongPressStart: (details) {
            controller.stop(canceled: false);
          },
          onLongPressEnd: (_) {
            controller.forward();
          },
          onTapUp: (details) {
            controller.forward();
            if (details.localPosition.dx > constraints.maxWidth / 2) {
              onEnd();
            } else {
              onPrevious();
            }
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: currentContent.contentUrl!,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red[400],
                            ),
                            const SizedBox(height: 10),
                            Text(error.toString())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(child: Material(child: buildBody(context))),
          Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return SafeArea(
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.content.map((cnt) {
                                  return Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: widget.content.last == cnt
                                              ? 0
                                              : 4),
                                      child: StoryProgressIndicator(
                                        isPlaying(cnt, currentContent)
                                            ? currentAnimation?.value ?? 0
                                            : widget.content.indexOf(cnt) <
                                                    widget.content
                                                        .indexOf(currentContent)
                                                ? 1
                                                : 0,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isPlaying(Contents context, Contents currentContent) {
    return widget.content.indexOf(context) ==
        widget.content.indexOf(currentContent);
  }
}

class StoryProgressIndicator extends StatelessWidget {
  final double value;
  final double indicatorHeight;

  const StoryProgressIndicator(
    this.value, {
    super.key,
    this.indicatorHeight = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(
        indicatorHeight,
      ),
      foregroundPainter: IndicatorOval(
        Colors.black.withOpacity(0.8),
        value,
      ),
      painter: IndicatorOval(
        Colors.blue.withOpacity(0.4),
        1.0,
      ),
    );
  }
}

class IndicatorOval extends CustomPainter {
  final Color color;
  final double widthFactor;

  IndicatorOval(this.color, this.widthFactor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width * widthFactor, size.height),
          const Radius.circular(3),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
