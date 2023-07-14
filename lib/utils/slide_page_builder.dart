import 'package:flutter/material.dart';

class SlidePageBuilder extends PageRouteBuilder {
  final bool opposite;
  final bool vertical;
  SlidePageBuilder({
    required Widget Function(BuildContext) builder,
    this.opposite = false,
    this.vertical = false,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) =>
                builder(context),
            transitionDuration: duration,
            reverseTransitionDuration: duration);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var tween = Tween<Offset>(
        begin: vertical == false
            ? (opposite == true ? const Offset(-1, 0) : const Offset(1, 0))
            : opposite == true
                ? const Offset(0, -1)
                : const Offset(0, 1),
        end: const Offset(0, 0));
    var anim =
        CurvedAnimation(parent: animation, curve: Curves.easeOut).drive(tween);
    return SlideTransition(
      position: anim,
      child: child,
    );
  }
}
