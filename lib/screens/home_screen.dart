import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_challenge_v2/bloc/adventure_bloc.dart';
import 'package:senior_flutter_challenge_v2/model/adventure_model.dart';
import 'package:senior_flutter_challenge_v2/widget/adventure_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdventureModel? adventureModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AdventureBloc>().add(LoadAdventure());
    });
    super.initState();
  }

  List<Widget> _getAdventureCard() {
    List<Widget> _swipeableCard = <Widget>[];

    // for (var i = 0; i < adventureModel!.data.length; i++) {
    //   _swipeableCard.add(AdventureCard(adventure: adventureModel!.data[i]));
    // }

    return _swipeableCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<AdventureBloc, AdventureState>(
            listener: (context, state) {
              if (state is AdventureLoaded) {
                setState(() {
                  adventureModel = state.adventureModel;
                });
                print("Loaded ${state.adventureModel.data.length}");
              }
              if (state is AdventureFailed) {
                print("something went wrong");
              }
            },
            child: Container(),
          ),
          if (adventureModel != null) ...[
            AdventureCard(
              content: adventureModel!.data[0].contents!,
              contentCount: adventureModel!.data[0].contents!.length,
              currentIndex: 0,
            ),
          ],
        ],
      ),
    );
  }
}
