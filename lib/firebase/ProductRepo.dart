import 'package:cashier/firebase/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class productRepo{
  final _db = FirebaseFirestore.instance;
  String message = "";
  createProduct(Product product)async{
    await _db.collection("products").add(product.toJson()).whenComplete((){ message= "Added";}).onError((error, stackTrace){ message = "error";throw "error";});
    
  }
  Future<Product> getProductByCode(String id) async {
    final snapshot = await _db.collection("products").where("id", isEqualTo: id).get();
    if (snapshot.docs.isEmpty) {
      throw Exception("Product not found");
    }
    final product = Product.fromSnapshot(snapshot.docs.first);
    return product;
  }
  Future<List<Product>> getAll()async {
    final snapshot = await _db.collection("products").get();
    final products = snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
      return products;

  }

  Future<void> deleteProductByCode(String id) async {
    final product = await getProductByCode(id);
    await _db.collection("products").doc(product.id).delete().whenComplete((){ message= "deleted";}).onError((error, stackTrace){ throw "error";});
  }
  Future<void> UpdateProductByCode(String id) async {
    final product = await getProductByCode(id);
      await _db.collection("products").doc(product.id).update(product.toJson()).whenComplete((){ message= "updated";}).onError((error, stackTrace){ throw "error";});}
  }
