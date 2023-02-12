import 'package:flutter/material.dart';

class HomeDataModel {
  IconData iconData;
  String name;
  Color textColor;
  HomeDataModel(
      {required this.name,
        required this.iconData,
        this.textColor = Colors.black});
}