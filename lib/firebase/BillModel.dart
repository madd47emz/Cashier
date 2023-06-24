import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';

class Bill {
  String id;
  DateTime date;
  List<Product> products;
  double total;

  Bill({
    required this.id,
    required this.date,
    required this.products,
    required this.total,
  });

  factory Bill.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data()!;
    List<Product> products = (json['products'] as List<dynamic>)
        .map((productData) => Product.fromSnapshot(productData))
        .toList();

    return Bill(
      id: json['id'],
      date: DateTime.parse(json['date']),
      products: products,
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> productJsonList =
    products.map((product) => product.toJson()).toList();

    return {
      'id': id,
      'date': Timestamp.fromDate(date),
      'products': productJsonList,
      'total': total,
    };
  }
}
