part of 'shoes_bloc.dart';

@immutable
abstract class ShoesState {}

class ShoesInitial extends ShoesState {}

abstract class ShoesActionState extends ShoesState {}

class ShoesLoadingState extends ShoesState {}

class ShoesSuccessLoadedState extends ShoesState {
  final List<DisplayProductModel> shoesCollections;

  ShoesSuccessLoadedState({required this.shoesCollections});
}

class ShoesErrorState extends ShoesState {}
