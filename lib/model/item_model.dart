import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  Column discription;
  Color colorsItem;
  String img;
  BuildContext context1;

  ItemModel(
      {this.expanded: false,
      this.headerItem,
      this.discription,
      this.colorsItem,
      this.img});
}
