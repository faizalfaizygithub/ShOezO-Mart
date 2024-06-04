part of 'watches_bloc.dart';

@immutable
abstract class WatchesState {}

class WatchesInitial extends WatchesState {}

abstract class WatchesActionState extends WatchesState {}

class WatchesLoadingState extends WatchesState {}

class WatchesSuccessLoadedState extends WatchesState {
  final List<DisplayProductModel> watchesCollections;

  WatchesSuccessLoadedState({required this.watchesCollections});
}

class WatchesErrorState extends WatchesState {}
