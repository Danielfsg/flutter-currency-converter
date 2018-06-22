import 'package:flutter/material.dart';

class IntroItem {
  IntroItem({this.title, this.description, this.icon, this.color});

  final String title;
  final String description;
  final String icon;
  final Color color;
}

final introItems = <IntroItem>[
  new IntroItem(
      title: "page1",
      description: "description1",
      icon: "icon1",
      color: Colors.blue),
  new IntroItem(
      title: "page2",
      description: "description2",
      icon: "icon2",
      color: Colors.lightGreen),
  new IntroItem(
      title: "page3",
      description: "description3",
      icon: "icon3",
      color: Colors.lightBlue)
];
