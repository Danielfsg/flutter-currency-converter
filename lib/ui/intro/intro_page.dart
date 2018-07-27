import 'package:flutter/material.dart';
import 'package:flutter_currency_app/ui/intro_page_view.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IntroPageView();
}

abstract class IntroPageState extends State<IntroPage> {
  void startApp(BuildContext context) {
    Navigator.popAndPushNamed(context, "");
  }
}
