import 'package:flutter/cupertino.dart';

class OnlineModel{
  String title;
  String subTitle;
  double amount;
  IconData iconData;
  bool isSelected;
  OnlineModel({required this.iconData, required this.title, required this.subTitle, required this.amount, this.isSelected = false});
}