

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/home/presentation/widgets/home_send_money_button.dart';

import 'package:wallet/main.dart' as app;
import 'package:wallet/res/strings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test integration', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // tap toggle
    final toggleButton = find.byKey(const ValueKey('homeToggle'));
    await tester.tap(toggleButton);
    await tester.pumpAndSettle();
    expect(find.text(Constants.obscuredBalance), findsOne);

    // tap send money
    final sendMoneyButton = find.byType(HomeSendMoneyButton);
    await tester.tap(sendMoneyButton);
    await tester.pumpAndSettle();
    expect(find.text(Strings.sendMoney), findsOne);

    // enter money and tap submit
    final moneyInputField = find.byKey(const ValueKey('moneyInputField'));
    final submitButton = find.byKey(const ValueKey('submitButton'));
    await tester.enterText(moneyInputField, '30000');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
    await tester.pump(Durations.extralong2);
    expect(find.byKey(const ValueKey('sendMoneyBottomSheet')), findsOneWidget);
    tester.state<NavigatorState>(find.byType(Navigator)).pop();
    await tester.pumpAndSettle();
    await tester.pump(Durations.extralong4);

    // navigate back to home screen
    tester.state<NavigatorState>(find.byType(Navigator)).pop();
    await tester.pumpAndSettle();
    expect(find.text(Constants.obscuredBalance), findsOne);
    
    // tap transactions button
    final transactionsButton = find.byKey(const ValueKey('transactionsButton'));
    expect(transactionsButton, findsOneWidget);
    await tester.tap(transactionsButton);
    // await tester.pump(Durations.extralong4);
    await tester.pumpAndSettle();
    await tester.pump(Durations.extralong4);
    // expect(find.text(Strings.transactions), findsOne);
  });
}