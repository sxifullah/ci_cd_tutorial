import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab5_p2/main.dart'; // Replace with the actual import for your main.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Navigate through pages and perform basic interactions',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Verify we are on the ActivationPage
      expect(find.text('Welcome !'), findsOneWidget);

      // Tap on the checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Tap on the 'Get Activation Code' button
      await tester.tap(find.text('Get Activation Code'));
      await tester.pumpAndSettle(); // Wait for navigation

      // Verify we are now on the OTP page
      expect(find.text('Enter the activation code you received via SMS.'),
          findsOneWidget);
    });
  });
}
