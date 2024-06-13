import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/allProduct.dart';
import 'package:ui/model/productDataModel.dart';

part 'slippers_event.dart';
part 'slippers_state.dart';

class SlippersBloc extends Bloc<SlippersEvent, SlippersState> {
  SlippersBloc() : super(SlippersInitial()) {
    on<SlippersInitialEvent>(slippersInitialEvent);
  }

  Future<FutureOr<void>> slippersInitialEvent(
      SlippersInitialEvent event, Emitter<SlippersState> emit) async {
    emit(SlippersLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(SlippersSuccessLoadedState(
        slippersCollections: AllProductsData.listOfSlippers!));
  }
}
