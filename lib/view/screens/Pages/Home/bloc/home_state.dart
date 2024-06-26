part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessLoadedState extends HomeState {
  final List<DisplayProductModel>? displayProducts;

  HomeSuccessLoadedState({required this.displayProducts});
}

class HomeErrorState extends HomeState {}
