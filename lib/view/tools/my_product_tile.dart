import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Home/bloc/home_bloc.dart';

class MyProductTile extends StatelessWidget {
  final HomeBloc homeBloc;
  final DisplayProductModel homeDisplayProductModel;
  const MyProductTile(
      {super.key,
      required this.homeBloc,
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
              child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  homeDisplayProductModel.imagePath,
                  fit: BoxFit.cover,
                ),
              ))),
          //title
          Text(
            homeDisplayProductModel.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //amount

          Text(
            "₹${homeDisplayProductModel.price.toString()}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
