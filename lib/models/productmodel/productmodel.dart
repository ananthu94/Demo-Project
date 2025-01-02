class Product {
  String title;
  double description;
  String price;
  String color;
  dynamic Pimages;
  int quantity; // to track the quantity in the cart

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.color,
    required this.Pimages,
    this.quantity = 1,
  });
}
