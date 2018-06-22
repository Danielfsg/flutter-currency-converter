import 'package:circle_indicator/circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_app/model/intro_model.dart';
import 'package:flutter_currency_app/ui/intro_page.dart';

class IntroPageView extends IntroPageState {
  final PageController controller = new PageController();

  final pageList = <IntroPageItem>[
    new IntroPageItem(
      item: introItems[0],
    ),
    new IntroPageItem(
      item: introItems[1],
    ),
    new IntroPageItem(
      item: introItems[2],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(
          top: 16.0,
        ),
        decoration: new BoxDecoration(color: Colors.blue),
        child: new Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            new PageView.builder(
                itemBuilder: (_, int position) =>
                    IntroPageItem(item: introItems[position]),
                itemCount: introItems.length,
                controller: controller),
            new Container(
              margin: new EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: new CircleIndicator(controller, introItems.length, 3.0,
                  Colors.white70, Colors.white),
            ),
//            new IntroductionWidget(
//              circleIndicator: new CircleIndicator(controller,
//                  introItems.length, 3.0, Colors.white70, Colors.white),
//            )
          ],
        ),
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
