import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Shoes/bloc/bloc/shoes_bloc.dart';
import 'package:ui/view/screens/Pages/Shoes/ui/shoes_collection_tile.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  final ShoesBloc shoesBloc = ShoesBloc();

  @override
  void initState() {
    shoesBloc.add(ShoesInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes Collections'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: BlocConsumer<ShoesBloc, ShoesState>(
            bloc: shoesBloc,
            listener: (context, state) {},
            listenWhen: (previous, current) => current is ShoesActionState,
            buildWhen: (previous, current) => current is! ShoesActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case ShoesLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case ShoesSuccessLoadedState:
                  final shoesData = state as ShoesSuccessLoadedState;
                  return GridView.builder(
                      itemCount: shoesData.shoesCollections.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ShoesCollectionTile(
                              shoesBloc: shoesBloc,
                              homeDisplayProductModel:
                                  shoesData.shoesCollections[index]),
                        );
                      });
                case ShoesErrorState:
                  return const Center(child: Text('error somthing'));

                default:
                  return const SizedBox();
              }
            },
          )),
    );
  }
}
