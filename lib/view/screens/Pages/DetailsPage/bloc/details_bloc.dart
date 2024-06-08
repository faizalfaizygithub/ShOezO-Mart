import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/tools/cart_items.dart';
import 'package:ui/view/tools/detailsProduct.dart';
import 'package:ui/view/tools/wishlist_items.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsInitialEvent>(detailsInitialEvent);
    on<FavoriteButtonClickedEvent>(favoriteButtonClickedEvent);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
    on<FavoriteButtonNavigateEvent>(favoriteButtonNavigateEvent);
    on<CartButtonNavigateEvent>(cartButtonNavigateEvent);
    on<FavoriteButtonClickedRemoveEvent>(favoriteButtonClickedRemoveEvent);
  }

  FutureOr<void> detailsInitialEvent(
      DetailsInitialEvent event, Emitter<DetailsState> emit) {
    emit(DetailSuccessLoadedState(detailsProduct: detailsProduct));
  }

  FutureOr<void> favoriteButtonClickedEvent(
      FavoriteButtonClickedEvent event, Emitter<DetailsState> emit) {
    wishListItems.add(event.clickedProduct);
    emit(ProductItemWishlistedActionState());
  }

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<DetailsState> emit) {
    cartItems.add(event.clickedProduct!);
    emit(ProductItemCartedActionState());
  }

  FutureOr<void> favoriteButtonNavigateEvent(
      FavoriteButtonNavigateEvent event, Emitter<DetailsState> emit) {
    emit(NavigateToWishlistPageActionState());
  }

  FutureOr<void> cartButtonNavigateEvent(
      CartButtonNavigateEvent event, Emitter<DetailsState> emit) {
    emit(NavigateToCartPageActionState());
  }

  FutureOr<void> favoriteButtonClickedRemoveEvent(
      FavoriteButtonClickedRemoveEvent event, Emitter<DetailsState> emit) {
    wishListItems.remove(event.clickedProduct);
    emit(ProductItemWishlistedActionState());
  }
}
