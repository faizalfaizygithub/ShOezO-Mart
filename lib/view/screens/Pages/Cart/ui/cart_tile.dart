import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Cart/bloc/cart_bloc.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class MyCartTile extends StatelessWidget {
  final CartBloc cartBloc;
  final DisplayProductModel homeDisplayProductModel;
  const MyCartTile(
      {super.key,
      required this.homeDisplayProductModel,
      required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //imagepath
          Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  homeDisplayProductModel.imagePath,
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  homeDisplayProductModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: mediumTextStyle,
                ),
              ),
              Text(
                "₹${homeDisplayProductModel.price.toString()}",
                style: smallTextStyle,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              cartBloc.add(CartRemoveFromCartEvent(
                  displayProductModel: homeDisplayProductModel));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          //
        ],
      ),
    );
  }
}
