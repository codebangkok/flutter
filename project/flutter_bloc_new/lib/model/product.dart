class Product {
  int id;
  String name;
  double price;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        image: json['image'],
      );
}
