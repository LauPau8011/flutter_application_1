class Product {
  final int id;
  final String name;
  final String brand;
  final double price;
  final String? image;

  Product({required this.id, required this.name, required this.brand, required this.price, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
    );
  }
}
