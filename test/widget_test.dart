import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/pages/aboutus_page.dart';

void main() {
  group('Footer Widget Tests', () {
    testWidgets('Footer displays all text elements', (WidgetTester tester) async {
      // Build the Footer widget wrapped in a MaterialApp for context
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify that all text elements are displayed
      expect(find.text('Union Shop'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact Us'), findsOneWidget);
      expect(find.text('© 2025 Union Shop. All rights reserved.'), findsOneWidget);
    });

    testWidgets('Footer has correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Find the title text widget
      final titleFinder = find.text('Union Shop');
      expect(titleFinder, findsOneWidget);

      // Verify the title has correct styling
      final Text titleWidget = tester.widget(titleFinder);
      expect(titleWidget.style?.fontSize, 18);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.color, Colors.black);
    });

    testWidgets('About Us button navigates to /about route', (WidgetTester tester) async {
      // Track if navigation was attempted
      String? navigatedRoute;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
          routes: {
            '/about': (context) {
              navigatedRoute = '/about';
              return const AboutUs();
            },
          },
        ),
      );

      // Find and tap the About Us button
      final aboutButton = find.widgetWithText(TextButton, 'About Us');
      expect(aboutButton, findsOneWidget);

      await tester.tap(aboutButton);
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(navigatedRoute, '/about');
      expect(find.byType(AboutUs), findsOneWidget);
    });

    testWidgets('Contact Us button is clickable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Find and tap the Contact Us button
      final contactButton = find.widgetWithText(TextButton, 'Contact Us');
      expect(contactButton, findsOneWidget);

      // Verify button can be tapped (doesn't throw error)
      await tester.tap(contactButton);
      await tester.pump();

      // Since it's a dummy link, just verify no crash occurred
      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('Footer has correct background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Find the root container
      final Container footerContainer = tester.widget(find.byType(Container).first);
      expect(footerContainer.color, Colors.grey[50]);
    });

    testWidgets('Footer takes full width', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Find the root container
      final Container footerContainer = tester.widget(find.byType(Container).first);
      expect(footerContainer.constraints?.maxWidth, double.infinity);
    });

    testWidgets('Both buttons are in a Row layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify Row exists containing the buttons
      expect(find.byType(Row), findsWidgets);
      
      // Verify both TextButtons exist
      expect(find.byType(TextButton), findsNWidgets(2));
    });
  });
}