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

      // Verify we are on the DashboardPage
      expect(find.text('Dashboard Page'), findsOneWidget);

      // Navigate to Engineer Page
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Verify we are on the EngineerPage
      expect(find.text('Engineer Page'), findsOneWidget);

      // Navigate to Notification Page
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Verify we are on the NotificationPage
      expect(find.text('Minimum Threshold'), findsOneWidget);

      // Select Factory 2
      await tester.tap(find.text('Factory 2'));
      await tester.pumpAndSettle();

      // Verify Factory 2 is selected
      expect(find.text('Factory 2'), findsOneWidget);

      // Navigate back to Dashboard Page
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Verify we are back on the DashboardPage
      expect(find.text('Dashboard Page'), findsOneWidget);
    });
  });
}
