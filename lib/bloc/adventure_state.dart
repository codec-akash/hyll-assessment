part of 'adventure_bloc.dart';

class AdventureState extends Equatable {
  const AdventureState();

  @override
  List<Object> get props => [];
}

class AdventureUninitialized extends AdventureState {}

class AdventureFailed extends AdventureState {
  final String errorMessage;

  AdventureFailed({required this.errorMessage});
}

class AdventureLoading extends AdventureState {}

class AdventureLoaded extends AdventureState {
  final AdventureModel adventureModel;

  AdventureLoaded({required this.adventureModel});
}
