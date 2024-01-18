import 'package:eatery/features/dishe/view/dishe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:eatery/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('taps, navigation, and entering text', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 8));

    final textFieldFinder = find.byKey(const Key('textField'));

    await tester.enterText(textFieldFinder, 'Бор');
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    expect(find.text('Бор'), findsOneWidget);

    final navigationButtonFinder = find.byKey(const Key('list'));

    tester.tap(navigationButtonFinder);
    await Future.delayed(const Duration(seconds: 4));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 4));

    expect(find.byType(DisheScreen), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsNothing);

    final incrementButtonFinder = find.byKey(const Key('increment'));

    tester.tap(incrementButtonFinder);
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    expect(find.text('2'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
