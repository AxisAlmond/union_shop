class Product {
  final String title;
  final double price;
  final String imagePath;
  final bool isPopular;
  final String description;
  final bool isSale;
  final double? originalPrice;
  final List<String>? availableSizes;
  final List<String>? availableColors;

  Product({
    required this.title,
    required this.price,
    required this.imagePath,
    this.isPopular = false,
    required this.description,
    this.isSale = false,
    this.originalPrice,
    this.availableSizes,
    this.availableColors,
  });
}