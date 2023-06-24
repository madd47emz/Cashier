import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  double price;
  String description;
  int quantity;
  DateTime expiration;
  DateTime created;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.expiration,
    required this.created,
  });

  factory Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data()!;
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      quantity: json['quantity'],
      expiration: DateTime.parse(json['expiration']),
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'quantity': quantity,
      'expiration': Timestamp.fromDate(expiration),
      'created': Timestamp.fromDate(created),
    };
  }
}
