import 'package:flutter/material.dart';

TextStyle customTextStyle({
  double size = 14.0, // Default size
  FontWeight weight = FontWeight.normal, // Default weight
  Color color = Colors.black,
  // Default color
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
    fontFamily: "Roboto"
  );
}
