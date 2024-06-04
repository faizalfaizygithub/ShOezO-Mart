import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/allProduct.dart';
import 'package:ui/model/productDataModel.dart';

part 'shoes_event.dart';
part 'shoes_state.dart';

class ShoesBloc extends Bloc<ShoesEvent, ShoesState> {
  ShoesBloc() : super(ShoesInitial()) {
    on<ShoesInitialEvent>(shoesInitialEvent);
  }

  FutureOr<void> shoesInitialEvent(
      ShoesInitialEvent event, Emitter<ShoesState> emit) async {
    emit(ShoesLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      ShoesSuccessLoadedState(
          shoesCollections: AllProductsData.listOfShoes!
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
