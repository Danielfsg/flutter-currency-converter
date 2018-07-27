import 'package:flutter/material.dart';
import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/model/rate.dart';
import 'package:flutter_currency_app/ui/result/result_page.dart';
import 'package:intl/intl.dart';

class HomePageView extends HomePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Exchange"),
        backgroundColor: ColorPrimary,
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  goToCurrencyPage(context);
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(32.0),
            alignment: Alignment.topCenter,
            height: 200.0,
            width: 200.0,
            decoration: ShapeDecoration(
              color: ColorSecondary,
              shadows: [BoxShadow(blurRadius: 16.0, color: Colors.black45)],
              shape: CircleBorder(
                side:
                    BorderSide(style: BorderStyle.solid, color: ColorSecondary),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _exchangeRateWidget(50, "GBP", "EUR"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _exchangeRateWidget(var value,
      [String base = "EUR", String currency = "USD"]) {
    return FutureBuilder<dynamic>(
      future: exchangeRate(base),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ExchangeRate exchange = snapshot.data;

          var formatBase = NumberFormat.compactSimpleCurrency(name: base);
          var formatCurrency = NumberFormat.compactSimpleCurrency(
              name: currency, decimalDigits: 3);

          var rates = exchange.rates.toMap();
          var ex = value * rates[currency];

          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${formatBase.format(value)} $base",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${formatCurrency.format(ex)} $currency",
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
              )
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
