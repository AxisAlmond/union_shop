import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/head.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Head(),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text('Welcome to the Union Shop!',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(3),
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text(
                    'We’re dedicated to giving you the very best ' +
                        'University branded products, with a range of clothing and ' +
                        'merchandise available to shop all year round! We even offer ' +
                        ' an exclusive personalisation service!',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.33))),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text(
                    'All online purchases are available ' +
                        'for delivery or instore collection!',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.33))),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text(
                    'We hope you enjoy our products as much as we enjoy ' +
                        'offering them to you. If you have any questions or comments, ' +
                        'please don’t hesitate to contact us at hello@upsu.net.',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.33))),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text(
                  'Happy Shopping!',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.33))),
            Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text(
                    'The Union Shop & Reception Team​​​​​​​​​',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.33))),
            Footer(),
          ],
        ),
      ),
    );
  }
}
