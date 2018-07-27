import 'package:flutter/material.dart';
import 'package:flutter_currency_app/data/repository.dart';
import 'package:flutter_currency_app/ui/currency/currency_page.dart';
import 'package:flutter_currency_app/ui/result/result_page_view.dart';

class HomePage extends StatefulWidget {
  static final String path = "/result";

  @override
  State<StatefulWidget> createState() => new HomePageView();
}

abstract class HomePageState extends State<HomePage> {
  @protected
  Repository repository = new Repository();

  @protected
  exchangeRate([String base = "EUR"]) => repository.getExchangeRate(base);

  @protected
  void goToCurrencyPage(BuildContext context) async {
    Navigator.of(context).pushNamed(CurrencyPage.path);
  }
}
