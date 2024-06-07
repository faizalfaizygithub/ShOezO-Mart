import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/DetailsPage/bloc/details_bloc.dart';
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
  final DetailsBloc detailsBloc = DetailsBloc();
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
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
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
                  "${widget.homeDisplayProductModel.imagePath}",
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
                trailing: IconButton(
                    onPressed: () {
                      detailsBloc.add(FavoriteButtonClickedEvent(
                          clickedProduct: widget.homeDisplayProductModel));
                    },
                    icon: Icon(Icons.favorite_outline))),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.homeDisplayProductModel.description,
                  style: smallTextStyle),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  buttonName: 'Added to Cart',
                  buttonColor: Colors.white,
                  buttonTextColor: Colors.black87,
                  ontap: () {
                    myPopup();
                  },
                ),
                MyButton(
                  buttonName: 'Order Now',
                  buttonColor: Colors.black87,
                  buttonTextColor: Colors.white,
                  ontap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
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
                      backgroundColor: Colors.indigo,
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
