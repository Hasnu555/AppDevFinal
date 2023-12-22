
class Product {
  String id;
  String name;
  int price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });


  // Product copyWith({
  //   String? id,
  //   String? name,
  //   int? price,
  // }) {
  //   return Product(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     price: price ?? this.price,
  //   );
  // }
}
