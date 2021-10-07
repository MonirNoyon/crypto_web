import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget bottomIcon(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black12),
            child: Icon(FontAwesome.facebook_f),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black12),
            child: Icon(FontAwesome.twitter),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black12),
            child: Icon(FontAwesome.google),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 3),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black12),
            child: Icon(FontAwesome.instagram),
          ),
        ),
      ),
    ],
  );
}