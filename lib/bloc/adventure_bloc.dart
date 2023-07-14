import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_challenge_v2/model/adventure_model.dart';
import 'package:senior_flutter_challenge_v2/repo/adventure_repo.dart';

part 'adventure_state.dart';
part 'adventure_event.dart';

class AdventureBloc extends Bloc<AdventureEvent, AdventureState> {
  AdventureRepo adventureRepo = AdventureRepo();
  AdventureModel? adventure;
  AdventureBloc() : super(AdventureUninitialized()) {
    on<LoadAdventure>((event, emit) async {
      emit(AdventureLoading());
      print("started here");
      if ((adventure?.offset ?? 0) != adventure?.count) {
        print("started here inside if condition");
        AdventureModel loadedAdventure =
            await adventureRepo.loadAdventure(adventure?.offset ?? 10);
        adventure = AdventureModel(
          count: loadedAdventure.count,
          data: loadedAdventure.data,
          offset: (adventure?.offset ?? 0) + 10,
        );
        print("started here success");
        emit(AdventureLoaded(adventureModel: adventure!));
      } else {
        emit(AdventureLoaded(adventureModel: adventure!));
      }
      try {} catch (e) {
        emit(AdventureFailed(errorMessage: e.toString()));
      }
    });
  }
}
