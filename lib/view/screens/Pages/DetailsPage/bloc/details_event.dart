part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class DetailsInitialEvent extends DetailsEvent {}

class FavoriteButtonClickedEvent extends DetailsEvent {
  final DisplayProductModel clickedProduct;
  FavoriteButtonClickedEvent({
    required this.clickedProduct,
  });
}

class FavoriteButtonClickedRemoveEvent extends DetailsEvent {
  final DisplayProductModel clickedProduct;
  FavoriteButtonClickedRemoveEvent({
    required this.clickedProduct,
  });
}

class CartButtonClickedEvent extends DetailsEvent {
  final DisplayProductModel? clickedProduct;
  CartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class FavoriteButtonNavigateEvent extends DetailsEvent {}

class CartButtonNavigateEvent extends DetailsEvent {}
