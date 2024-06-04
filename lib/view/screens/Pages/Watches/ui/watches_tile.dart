import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Watches/bloc/bloc/watches_bloc.dart';

class WatchesCollectionTile extends StatelessWidget {
  final WatchesBloc watchesBloc;
  final DisplayProductModel homeDisplayProductModel;
  const WatchesCollectionTile(
      {super.key,
      required this.watchesBloc,
      required this.homeDisplayProductModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey.shade400),
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
                homeDisplayProductModel.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //title
          Text(
            homeDisplayProductModel.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //amount

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹${homeDisplayProductModel.price.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
