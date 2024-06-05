import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/Common_pages/details_page.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class MyProductTile extends StatelessWidget {
  final DisplayProductModel homeDisplayProductModel;
  const MyProductTile({super.key, required this.homeDisplayProductModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailsPage(homeDisplayProductModel: homeDisplayProductModel));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 300,
        width: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(
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
            Text(homeDisplayProductModel.name,
                overflow: TextOverflow.ellipsis, style: mediumTextStyle),
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
      ),
    );
  }
}
