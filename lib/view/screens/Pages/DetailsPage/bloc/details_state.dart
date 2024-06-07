part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

abstract class DetailsActionState extends DetailsState {}

class DetailsInitial extends DetailsState {}

class LoadingState extends DetailsState {}

class DetailSuccessLoadedState extends DetailsState {
  final List<DisplayProductModel>? detailsProduct;

  DetailSuccessLoadedState({required this.detailsProduct});
}

class ErrorState extends DetailsState {}

class NavigateToWishlistPageActionState extends DetailsActionState {}

class NavigateToCartPageActionState extends DetailsActionState {}

class ProductItemWishlistedActionState extends DetailsActionState {}

class ProductItemCartedActionState extends DetailsActionState {}
