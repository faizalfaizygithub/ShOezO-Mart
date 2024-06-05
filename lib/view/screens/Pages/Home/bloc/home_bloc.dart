import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/allProduct.dart';
import 'package:ui/model/productDataModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(
      HomeSuccessLoadedState(
          displyProducts: AllProductsData.listOfHomeProducts!
              .map(
                (e) => DisplayProductModel(
                    name: e["name"],
                    description: e["description"],
                    price: e["price"],
                    imagePath: e["imagePath"]),
              )
              .toList()),
    );
  }
}
