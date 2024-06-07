part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteInitialEvent extends FavoriteEvent {}

class FavoriteRemoveEvent extends FavoriteEvent {
  final DisplayProductModel displayProductModel;

  FavoriteRemoveEvent({required this.displayProductModel});
}
