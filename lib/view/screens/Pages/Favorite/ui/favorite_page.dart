import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Favorite/bloc/bloc/favorite_bloc.dart';
import 'package:ui/view/screens/Pages/Favorite/ui/favorite_tile.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();

  @override
  void initState() {
    favoriteBloc.add(FavoriteInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My WishList'),
          actions: const [
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: BlocConsumer<FavoriteBloc, FavoriteState>(
            listenWhen: (previous, current) => current is FavoriteActionState,
            buildWhen: (previous, current) => current is! FavoriteActionState,
            bloc: favoriteBloc,
            builder: (context, state) {
              switch (state.runtimeType) {
                case FavoriteSuccessState:
                  final wishListData = state as FavoriteSuccessState;
                  return wishListData.wishListItems.isEmpty
                      ? Center(
                          child: Text(
                            'Your wishlist is empty',
                            style: smallTextStyle,
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: wishListData.wishListItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FavorTile(
                                  displayProductModel:
                                      wishListData.wishListItems[index],
                                  favoriteBloc: favoriteBloc),
                            );
                          });

                default:
                  return Container();
              }
            },
            listener: (context, state) {}),
      ),
    );
  }
}
