import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Boots/bloc/bloc/boots_bloc.dart';
import 'package:ui/view/tools/my_product_tile.dart';

class BootsPage extends StatefulWidget {
  const BootsPage({super.key});

  @override
  State<BootsPage> createState() => _BootsPageState();
}

class _BootsPageState extends State<BootsPage> {
  final BootsBloc bootsBloc = BootsBloc();

  @override
  void initState() {
    bootsBloc.add(BootsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boots Collections'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<BootsBloc, BootsState>(
            bloc: bootsBloc,
            listener: (context, state) {},
            listenWhen: (previous, current) => current is BootsActionState,
            buildWhen: (previous, current) => current is! BootsActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case BootsLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case BootsSuccessLoadedState:
                  final bootsData = state as BootsSuccessLoadedState;
                  return GridView.builder(
                      itemCount: bootsData.bootsCollections.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyProductTile(
                              homeDisplayProductModel:
                                  bootsData.bootsCollections[index]),
                        );
                      });
                case BootsErrorState:
                  return const Center(child: Text('some error occurred'));

                default:
                  return const SizedBox();
              }
            },
          )),
    );
  }
}
