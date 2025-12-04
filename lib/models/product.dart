class Product {
  final String title;
  final double price;
  final String imagePath;
  final bool isPopular;
  final String description;

  Product({
    required this.title,
    required this.price,
    required this.imagePath,
    this.isPopular = false,
    required this.description,
  });
}