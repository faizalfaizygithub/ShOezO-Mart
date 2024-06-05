import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/tools/my_button.dart';

class DetailsPage extends StatefulWidget {
  final DisplayProductModel homeDisplayProductModel;

  const DetailsPage({
    super.key,
    required this.homeDisplayProductModel,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "₹${widget.homeDisplayProductModel.price}-/",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 4, 10, 44),
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.favorite_rounded)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.homeDisplayProductModel.description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  buttonName: 'Added to Cart',
                  buttonColor: Colors.white,
                  buttonTextColor: Colors.black87,
                ),
                MyButton(
                    buttonName: 'Order Now',
                    buttonColor: Colors.black87,
                    buttonTextColor: Colors.white),
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
}
