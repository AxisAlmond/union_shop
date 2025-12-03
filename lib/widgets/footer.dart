import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _navigateToAboutUs(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void _onContactTap() {
    // Dummy link
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Union Shop',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(children: [
            TextButton(
                onPressed: () => _navigateToAboutUs(context),
                child: const Text('About Us'),
              ),
            TextButton(
                onPressed: _onContactTap,
                child: const Text('Contact Us'),
              ),
          ]),
          const SizedBox(height: 8),
          const Text(
            '© 2025 Union Shop. All rights reserved.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
