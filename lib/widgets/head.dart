import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  const Head({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToCollections(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/collections', (route) => false);
  }

  void navigateToSale(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/collections/sales', (route) => false);
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/about', (route) => false);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'UNION SHOP',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Main header
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      navigateToHome(context);
                    },
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  // Navigation links (visible on desktop >800px)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _NavigationTile(
                              label: 'Home',
                              onTap: () => navigateToHome(context),
                            ),
                            _NavigationTile(
                              label: 'Shopping',
                              onTap: () => navigateToCollections(context),
                            ),
                            _NavigationTile(
                              label: 'SALE!',
                              onTap: () => navigateToSale(context),
                              isHighlight: true,
                            ),
                            _NavigationTile(
                              label: 'About',
                              onTap: () => navigateToAbout(context),
                            ),
                            _NavigationTile(
                              label: 'Login/Sign up',
                              onTap: () => navigateToLogin(context),
                            ),
                            const SizedBox(width: 16),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  // Icons (always visible)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: placeholderCallbackForButtons,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isHighlight;

  const _NavigationTile({
    required this.label,
    required this.onTap,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            color: isHighlight ? Colors.red : Colors.black,
            fontSize: isHighlight ? 14 : 13,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
