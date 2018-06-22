import 'package:flutter/material.dart';
import 'package:flutter_currency_app/ui/intro_page.dart';

void main() => runApp(new CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Currency Converter",
        theme: ThemeData.dark(),
        home: IntroPage(),
        debugShowCheckedModeBanner: true);
  }
}
