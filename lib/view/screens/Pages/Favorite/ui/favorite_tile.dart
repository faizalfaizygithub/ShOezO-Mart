import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Favorite/bloc/bloc/favorite_bloc.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class FavorTile extends StatelessWidget {
  final DisplayProductModel displayProductModel;
  final FavoriteBloc favoriteBloc;
  const FavorTile(
      {super.key,
      required this.displayProductModel,
      required this.favoriteBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      width: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(
              1,
              2,
            ),
            color: Colors.grey.shade400,
            spreadRadius: 2,
            blurRadius: 3)
      ], borderRadius: BorderRadius.circular(15), color: Colors.white54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //photo
          AspectRatio(
              aspectRatio: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  displayProductModel.imagePath,
                  fit: BoxFit.cover,
                ),
              )),
          //title
          Text(displayProductModel.name,
              overflow: TextOverflow.ellipsis, style: mediumTextStyle),
          //amount

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹${displayProductModel.price.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54),
              ),
              GestureDetector(
                onTap: () {
                  favoriteBloc.add(FavoriteRemoveEvent(
                      displayProductModel: displayProductModel));
                },
                child: const Icon(
                  Icons.cancel_presentation_rounded,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
