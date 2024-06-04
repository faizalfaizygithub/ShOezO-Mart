part of 'slippers_bloc.dart';

@immutable
abstract class SlippersState {}

class SlippersInitial extends SlippersState {}

abstract class SlippersActionState extends SlippersState {}

class SlippersLoadingState extends SlippersState {}

class SlippersSuccessLoadedState extends SlippersState {
  final List<DisplayProductModel> slippersCollections;

  SlippersSuccessLoadedState({required this.slippersCollections});
}

class SlippersErrorState extends SlippersState {}
