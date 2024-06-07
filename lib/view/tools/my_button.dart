import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final Function() ontap;
  const MyButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 49,
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )),
    );
  }
}
