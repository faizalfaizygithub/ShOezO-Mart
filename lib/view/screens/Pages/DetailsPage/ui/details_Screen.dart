import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Cart/ui/cart_page.dart';
import 'package:ui/view/screens/Pages/DetailsPage/bloc/details_bloc.dart';
import 'package:ui/view/screens/Pages/Favorite/bloc/bloc/favorite_bloc.dart';
import 'package:ui/view/tools/favoriteicon.dart';
import 'package:ui/view/tools/myTextStyle.dart';
import 'package:ui/view/tools/my_button.dart';

class DetailsPages extends StatefulWidget {
  final DisplayProductModel homeDisplayProductModel;

  const DetailsPages({
    super.key,
    required this.homeDisplayProductModel,
  });

  @override
  State<DetailsPages> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPages> {
  bool isFav = true;
  final DetailsBloc detailsBloc = DetailsBloc();
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black54)),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 5,
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "places-img ${widget.homeDisplayProductModel.imagePath}",
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
              child: Image.asset(
                height: 400,
                widget.homeDisplayProductModel.imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
                overflow: TextOverflow.ellipsis,
                widget.homeDisplayProductModel.name,
                style: subheadingStyle),
            subtitle: Text("₹${widget.homeDisplayProductModel.price}-/",
                style: mediumTextStyle),
            trailing:
                HeartIcon(displayProductModel: widget.homeDisplayProductModel),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.homeDisplayProductModel.description,
                style: smallTextStyle),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  buttonName: 'Added to Cart',
                  buttonColor: Colors.white,
                  buttonTextColor: Colors.black87,
                  ontap: () {
                    detailsBloc.add(CartButtonClickedEvent(
                        clickedProduct: widget.homeDisplayProductModel));

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.blueGrey,
                        content: Center(
                          child: Text(
                            'item added to cart',
                            style: smallWhiteTextStyle,
                          ),
                        )));
                  },
                ),
                MyButton(
                  buttonName: 'Buy Now',
                  buttonColor: Colors.black87,
                  buttonTextColor: Colors.white,
                  ontap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  myPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Are you sure want to Add this item to Cart?',
              style: smallTextStyle,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: subheadingStyle,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  detailsBloc.add(CartButtonClickedEvent(
                      clickedProduct: widget.homeDisplayProductModel));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.blueGrey,
                      content: Text(
                        'item added to the cart succesfully',
                        style: smallWhiteTextStyle,
                      )));
                },
                child: Text(
                  'Yes',
                  style: subheadingStyle,
                ),
              ),
            ],
          );
        });
  }
}
