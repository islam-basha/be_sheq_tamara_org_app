import 'package:flutter/material.dart';

Widget defaultButton({
  double width = 147,
  double height = 37,
  required double radius,
  Color background = const Color(0xff606C38),
  Color textColor = Colors.white,
  double size=16,
  required final VoidCallback function,
  required String text,

}) =>
    SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: background,
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)))),
        onPressed: function,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: size, color: textColor),
        ),
      ),
    );
