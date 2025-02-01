import 'package:flutter/material.dart';

TextStyle customTextStyle({
  double size = 14.0, // Default size
  FontWeight weight = FontWeight.normal, // Default weight
  Color color = Colors.black,
  // Default color
}) {
  return TextStyle(fontSize: size, fontWeight: weight, color: color, fontFamily: "Roboto");
}

Widget buildTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 34,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  );
}

PreferredSizeWidget customAppBar({
  required String title,
  Color titleColor = Colors.black,
  Color backgroundColor = Colors.white,
  bool? showBackIcon, // Nullable boolean parameter
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: titleColor, fontWeight: FontWeight.w400, fontSize: 30),
    ),
    backgroundColor: backgroundColor,
    centerTitle: false,
    elevation: 0.0,
    iconTheme: const IconThemeData(
      color: Colors.black, // Set the icon color to black
    ),
    automaticallyImplyLeading: showBackIcon ?? false, // Use showBackIcon or default to false
  );
}
