import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boots_event.dart';
part 'boots_state.dart';

class BootsBloc extends Bloc<BootsEvent, BootsState> {
  BootsBloc() : super(BootsInitial());

  @override
  Stream<BootsState> mapEventToState(
    BootsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
