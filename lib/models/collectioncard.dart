import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CollectionCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Collection thumbnail image
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.collections, size: 48, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            // Collection title
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}