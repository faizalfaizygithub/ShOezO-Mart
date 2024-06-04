import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Shoes/bloc/bloc/shoes_bloc.dart';
import 'package:ui/view/screens/Pages/Slippers/Bloc/bloc/slippers_bloc.dart';
import 'package:ui/view/screens/Pages/Slippers/UI/slippers_tile.dart';

class SlippersPage extends StatefulWidget {
  const SlippersPage({super.key});

  @override
  State<SlippersPage> createState() => _SlippersPageState();
}

class _SlippersPageState extends State<SlippersPage> {
  final SlippersBloc slippersBloc = SlippersBloc();

  @override
  void initState() {
    slippersBloc.add(SlippersInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slippers Collections'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: BlocConsumer<SlippersBloc, SlippersState>(
            bloc: slippersBloc,
            listener: (context, state) {},
            listenWhen: (previous, current) => current is SlippersActionState,
            buildWhen: (previous, current) => current is! SlippersActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case SlippersLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case SlippersSuccessLoadedState:
                  final slippersData = state as SlippersSuccessLoadedState;
                  return GridView.builder(
                      itemCount: slippersData.slippersCollections.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SlippersCollectionTile(
                              slippersBloc: slippersBloc,
                              homeDisplayProductModel:
                                  slippersData.slippersCollections[index]),
                        );
                      });
                case ShoesErrorState:
                  return const Center(child: Text('some error occurred'));

                default:
                  return const SizedBox();
              }
            },
          )),
    );
  }
}
