import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_app/main.dart';
import 'package:flutter_currency_app/model/intro.dart';
import 'package:flutter_currency_app/ui/intro/intro_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Intro Page Tests', () {
    testWidgets('first screen', (WidgetTester tester) async {
      await tester.pumpWidget(App(IntroPage()));
      await tester.pump(Duration(seconds: 5));

      expect(find.text(introItems[0].title), findsOneWidget);
      expect(find.text(introItems[0].description), findsOneWidget);
    });

    testWidgets('slide to next screen', (WidgetTester tester) async {
      await tester.pumpWidget(App(IntroPage()));
      await tester.pump(Duration(seconds: 5));
      await tester.fling(
          find.byType(PageView), const Offset(-401.0, 0.0), 1000.0);

      expect(find.text(introItems[1].title), findsOneWidget);
      expect(find.text(introItems[1].description), findsOneWidget);
    });

    testWidgets('find button by key', (WidgetTester tester) async {
      final skipButtonKey = Key("SkipButton");

      await tester.pumpWidget(App(IntroPage()));
      await tester.pump(Duration(seconds: 5));

      expect(find.byKey(skipButtonKey), findsOneWidget);
    });
  });
}
