import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/tools/wishlist_items.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteInitialEvent>(favoriteInitialEvent);
    on<FavoriteRemoveEvent>(favoriteRemoveEvent);
  }

  FutureOr<void> favoriteInitialEvent(
      FavoriteInitialEvent event, Emitter<FavoriteState> emit) {
    emit(FavoriteSuccessState(wishListItems: wishListItems));
  }

  FutureOr<void> favoriteRemoveEvent(
      FavoriteRemoveEvent event, Emitter<FavoriteState> emit) {
    wishListItems.remove(event.displayProductModel);

    emit(FavoriteSuccessState(wishListItems: wishListItems));
  }
}
