import 'package:circle_indicator/circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_app/model/intro_model.dart';
import 'package:flutter_currency_app/ui/intro_page.dart';

class IntroPageView extends IntroPageState {
  final PageController controller = new PageController();

  final pageList = <IntroPageItem>[
    new IntroPageItem(item: introItems[0]),
    new IntroPageItem(item: introItems[1]),
    new IntroPageItem(item: introItems[2]),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IntroductionWidget(
        pageList: pageList,
        circleIndicator: new CircleIndicator.withIntroduction(
            pageList.length, 3.0, Colors.white70, Colors.white),
        rightAction: () => startApp(context),
        showRight: (page) => page == pageList.length - 1,
        rightText: new Text("START"),
        leftAction: () => startApp(context),
        showLeft: (page) => true,
        leftText: new Text("SKIP"),
      ),
    );
  }
}

class IntroPageItem extends StatelessWidget {
  IntroPageItem({this.item});

  final IntroItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[new Center(child: new Text(item.title))],
        ));
  }
}
