part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

abstract class FavoriteActionState extends FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final List<DisplayProductModel> wishListItems;

  FavoriteSuccessState({required this.wishListItems});
}
