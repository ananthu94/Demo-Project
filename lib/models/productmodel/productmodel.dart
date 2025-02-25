class Product {
  final String title;
  final String description;
  final String price;
  final String color;
  final String imageUrl;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.color,
    required this.imageUrl,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      color: map['color'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['Pimages'] ?? '',
    );
  }
}
