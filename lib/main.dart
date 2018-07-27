import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/ui/home/home_page.dart';
import 'package:flutter_currency_app/ui/intro/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  Widget _defaultHome = new IntroPage();

  final SharedPreferences pref = await sharedPreferences;
  bool showIntro = pref.getBool(SKIP_INTRO);
  if (showIntro != null && showIntro) {
    _defaultHome = new HomePage();
  }

  runApp(new MaterialApp(
      title: "Currency Converter",
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        IntroPage.path: (BuildContext context) => new IntroPage(),
        HomePage.path: (BuildContext context) => new HomePage()
      },
      debugShowCheckedModeBanner: true));
}
