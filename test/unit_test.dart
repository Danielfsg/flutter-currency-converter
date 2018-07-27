import 'package:flutter_currency_app/common/utils.dart';
import 'package:test/test.dart';

main() {
  group('utils functions', () {
    test('Test formatCurrency', () {
      var test1 = formatCurrency("EUR", 12.25);
      var test2 = formatCurrency("USD", 25.56);

      expect(test1, "€12.25");
      expect(test2, "\$25.56");
    });

    test('Test formatDecimal', () {
      var test1 = formatDecimal(5.12828);
      var test2 = formatDecimal(54.92828);

      expect(test1, "5.1");
      expect(test2, "54.9");
    });

    test('Test percentageDifference', () {
      var test1 = percentageDifference(10.0, 20.0);
      var test2 = percentageDifference(20.0, 10.0);
      var test3 = percentageDifference(20.0, 20.0);

      expect(test1, 66.66666666666666);
      expect(test2, 66.66666666666666);
      expect(test3, 0.0);
    });

    test('Test percentageChange', () {
      var test1 = percentageChange(10.0, 20.0);
      var test2 = percentageChange(20.0, 10.0);
      var test3 = percentageChange(20.0, 20.0);

      expect(test1, 100.0);
      expect(test2, -50.0);
      expect(test3, 0.0);
    });

    test('Test checkPositive', () {
      var positive = checkPositive(10.0);
      var negative = checkPositive(-10.0);

      expect(positive, true);
      expect(negative, false);
    });

    test('Test dateIsBeforeToday', () {
      var dateTrue = dateIsBeforeToday(
          DateTime.now().subtract(Duration(days: 1)).toString());
      var dateFalse = dateIsBeforeToday(DateTime.now().toString());

      expect(dateTrue, true);
      expect(dateFalse, false);
    });
  });
}
