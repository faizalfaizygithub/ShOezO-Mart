import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Watches/bloc/bloc/watches_bloc.dart';
import 'package:ui/view/tools/my_product_tile.dart';

class WatchesPage extends StatefulWidget {
  const WatchesPage({super.key});

  @override
  State<WatchesPage> createState() => _WatchesPageState();
}

class _WatchesPageState extends State<WatchesPage> {
  final WatchesBloc watchesBloc = WatchesBloc();

  @override
  void initState() {
    watchesBloc.add(WatchesInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Collections'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: BlocConsumer<WatchesBloc, WatchesState>(
            bloc: watchesBloc,
            listener: (context, state) {},
            listenWhen: (previous, current) => current is WatchesActionState,
            buildWhen: (previous, current) => current is! WatchesActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case WatchesLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case WatchesSuccessLoadedState:
                  final watchData = state as WatchesSuccessLoadedState;
                  return GridView.builder(
                      itemCount: watchData.watchesCollections.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyProductTile(
                              // watchesBloc: watchesBloc,
                              homeDisplayProductModel:
                                  watchData.watchesCollections[index]),
                        );
                      });
                case WatchesErrorState:
                  return const Center(child: Text('some error occurred'));

                default:
                  return const SizedBox();
              }
            },
          )),
    );
  }
}
