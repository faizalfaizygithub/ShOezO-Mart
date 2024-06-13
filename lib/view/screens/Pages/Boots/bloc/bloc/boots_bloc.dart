import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui/model/allProduct.dart';
import 'package:ui/model/productDataModel.dart';

part 'boots_event.dart';
part 'boots_state.dart';

class BootsBloc extends Bloc<BootsEvent, BootsState> {
  BootsBloc() : super(BootsInitial()) {
    on<BootsInitialEvent>(bootsInitialEvent);
  }

  Future<FutureOr<void>> bootsInitialEvent(
      BootsInitialEvent event, Emitter<BootsState> emit) async {
    emit(BootsLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(BootsSuccessLoadedState(
        bootsCollections: AllProductsData.listOfBoots!));
  }
}
