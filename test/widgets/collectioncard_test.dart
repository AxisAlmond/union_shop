import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/collectioncard.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 200,
          height: 300,
          child: child,
        ),
      ),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Navigated to ${settings.name}')),
          ),
        );
      },
    );
  }

  group('CollectionCard Widget Tests', () {
    testWidgets('displays collection title', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'Summer Collection',
          imagePath: 'assets/images/collection.jpg',
          collectionId: 'summer',
        ),
      ));

      expect(find.text('Summer Collection'), findsOneWidget);
    });

    testWidgets('shows error icon when image fails to load', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'Test Collection',
          imagePath: 'invalid/path.jpg',
          collectionId: 'test',
        ),
      ));

      // Should show error icon
      expect(find.byIcon(Icons.collections), findsOneWidget);
    });

    testWidgets('navigates to collection route when tapped with collectionId', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'Apparel Collection',
          imagePath: 'assets/images/apparel.jpg',
          collectionId: 'apparel',
        ),
      ));

      await tester.tap(find.byType(CollectionCard));
      await tester.pumpAndSettle();

      expect(find.text('Navigated to /collections/apparel'), findsOneWidget);
    });

    testWidgets('uses custom onTap callback when provided', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(wrap(
        CollectionCard(
          title: 'Custom Collection',
          imagePath: 'assets/images/custom.jpg',
          onTap: () {
            tapped = true;
          },
        ),
      ));

      await tester.tap(find.byType(CollectionCard));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not navigate when collectionId is null and no custom onTap', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'No ID Collection',
          imagePath: 'assets/images/collection.jpg',
        ),
      ));

      await tester.tap(find.byType(CollectionCard));
      await tester.pumpAndSettle();

      // Should not navigate (stays on same screen)
      expect(find.text('No ID Collection'), findsOneWidget);
    });

    testWidgets('has rounded corners and shadow', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'Styled Collection',
          imagePath: 'assets/images/collection.jpg',
          collectionId: 'styled',
        ),
      ));

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(CollectionCard),
          matching: find.byType(Container),
        ).first,
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(8));
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, 1);
    });

    testWidgets('centers title text', (tester) async {
      await tester.pumpWidget(wrap(
        const CollectionCard(
          title: 'Centered Title',
          imagePath: 'assets/images/collection.jpg',
          collectionId: 'centered',
        ),
      ));

      final textWidget = tester.widget<Text>(find.text('Centered Title'));
      expect(textWidget.textAlign, TextAlign.center);
      expect(textWidget.style?.fontWeight, FontWeight.w600);
    });
  });
}
