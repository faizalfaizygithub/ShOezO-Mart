part of 'boots_bloc.dart';

@immutable
abstract class BootsState {}

class BootsInitial extends BootsState {}

abstract class BootsActionState extends BootsState {}

class BootsLoadingState extends BootsState {}

class BootsSuccessLoadedState extends BootsState {
  final List<DisplayProductModel> bootsCollections;

  BootsSuccessLoadedState({required this.bootsCollections});
}

class BootsErrorState extends BootsState {}
