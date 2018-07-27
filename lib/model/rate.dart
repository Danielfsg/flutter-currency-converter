import 'package:flutter_currency_app/model/coin.dart';

class ExchangeRateResponse {
  final String base;
  final String date;
  final Coin rates;

  ExchangeRateResponse({this.base, this.date, this.rates});

  ExchangeRateResponse.map(Map<dynamic, dynamic> map)
      : base = map["base"],
        date = map["date"],
        rates = map["rates"];
}
