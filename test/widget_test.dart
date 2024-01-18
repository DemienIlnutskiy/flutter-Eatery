import 'package:eatery/features/dishe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chceck dishe descriptions', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: DisheDescriptions(
      theme: TextTheme(),
      description: 'T',
    )));
    final Finder titleFinder = find.text('T');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Chceck dishe information', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: DisheInfo(
      theme: TextTheme(),
      rank: '3',
      price: '100',
    )));
    final Finder priceFinder = find.text('100');
    final Finder iconFinder = find.byIcon(Icons.star);

    expect(priceFinder, findsOneWidget);
    expect(iconFinder, findsAny);
  });

  testWidgets('Chceck dishe top menu icon', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DisheTopMenu()));
    final Finder iconFinder = find.byIcon(Icons.shopping_basket_outlined);

    expect(iconFinder, findsAny);
  });
}
