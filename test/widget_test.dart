import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';


void main() {
  group('Footer Widget Tests', () {
    Widget wrap() {
      return const MediaQuery(
        data: MediaQueryData(size: Size(1400, 900)),
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 1200,
                child: Footer(),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('Footer displays key text elements and opening times', (tester) async {
      await tester.pumpWidget(wrap());
      await tester.pumpAndSettle();

      expect(find.text('Union Shop'), findsOneWidget);
      expect(find.text('Contact Us'), findsOneWidget);
      expect(find.text('Newsletter'), findsOneWidget);
      expect(find.text('Opening Times'), findsOneWidget);
      expect(find.text('Monday - Friday'), findsOneWidget);
      expect(find.text('9:00 AM - 6:00 PM'), findsOneWidget);
      expect(find.text('Saturday'), findsOneWidget);
      expect(find.text('10:00 AM - 5:00 PM'), findsOneWidget);
      expect(find.text('Sunday'), findsOneWidget);
      expect(find.text('11:00 AM - 4:00 PM'), findsOneWidget);
      expect(find.text('Student Union Building, Ground Floor'), findsOneWidget);
      expect(find.text('© 2025 Union Shop. All rights reserved.'), findsOneWidget);
    });

    testWidgets('Footer title has expected styling', (tester) async {
      await tester.pumpWidget(wrap());
      final titleFinder = find.text('Union Shop');
      final Text titleWidget = tester.widget(titleFinder);
      expect(titleWidget.style?.fontSize, 18);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.color, Colors.black);
    });

    testWidgets('Contact Us button is tappable (no crash)', (tester) async {
      await tester.pumpWidget(wrap());
      final contactButton = find.widgetWithText(TextButton, 'Contact Us');
      expect(contactButton, findsOneWidget);
      await tester.tap(contactButton);
      await tester.pump();
      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('Footer background color and width', (tester) async {
      await tester.pumpWidget(wrap());
      final Container footerContainer = tester.widget(find.byType(Container).first);
      expect(footerContainer.color, Colors.grey[50]);
      expect(footerContainer.constraints?.maxWidth, double.infinity);
    });
  });
}