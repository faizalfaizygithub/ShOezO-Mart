import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/allProduct.dart';
import 'package:ui/model/productDataModel.dart';

part 'watches_event.dart';
part 'watches_state.dart';

class WatchesBloc extends Bloc<WatchesEvent, WatchesState> {
  WatchesBloc() : super(WatchesInitial()) {
    on<WatchesInitialEvent>(watchesInitialEvent);
  }

  Future<FutureOr<void>> watchesInitialEvent(
      WatchesInitialEvent event, Emitter<WatchesState> emit) async {
    emit(WatchesLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      WatchesSuccessLoadedState(
          watchesCollections: AllProductsData.listofWateches!
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
