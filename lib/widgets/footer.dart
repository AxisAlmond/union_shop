import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _onContactTap() {
    // Dummy link
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use column layout on mobile, row layout on desktop
          if (constraints.maxWidth < 600) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShopInfo(),
                const SizedBox(height: 24),
                _buildOpeningTimes(),
                const SizedBox(height: 24),
                _buildCopyright(),
              ],
            );
          }
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildShopInfo()),
                  const SizedBox(width: 48),
                  Expanded(child: _buildOpeningTimes()),
                ],
              ),
              const SizedBox(height: 24),
              _buildCopyright(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShopInfo() {
    return Column(
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
        TextButton(
          onPressed: _onContactTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 36),
            alignment: Alignment.centerLeft,
          ),
          child: const Text('Contact Us'),
        ),
        TextButton(
          onPressed: _onContactTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 36),
            alignment: Alignment.centerLeft,
          ),
          child: const Text('Newsletter'),
        ),
      ],
    );
  }

  Widget _buildOpeningTimes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Opening Times',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildTimeRow('Monday - Friday', '9:00 AM - 6:00 PM'),
        _buildTimeRow('Saturday', '10:00 AM - 5:00 PM'),
        _buildTimeRow('Sunday', '11:00 AM - 4:00 PM'),
        const SizedBox(height: 8),
        const Text(
          'Student Union Building, Ground Floor',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRow(String day, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              time,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyright() {
    return const Text(
      '© 2025 Union Shop. All rights reserved.',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}
