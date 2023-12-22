import 'package:cashier/Views/Register_Prod.dart';
import 'package:cashier/Views/utils/stockProduct.dart';
import 'package:cashier/Views/search.dart';
import 'package:cashier/firebase/ProductModel.dart';
import 'package:cashier/firebase/ProductRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  productRepo repo = productRepo();
  List<String> searchTerms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Create Product'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterProd()),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Inventory",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(searchTerms),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            )
  ],
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: repo.getAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Colors.redAccent),
                );
              } else {
                List<Product> products = snapshot.data!.docs.map((e) => Product.fromSnapshot(e)).toList();

                if (products.isNotEmpty) {
                  searchTerms = products.map((e) => e.name).toList();
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return stockProduct(product: products[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                    itemCount: products.length,
                  );
                }
                return Center(
                  child: Text("No products",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),fontSize: 15,)),
                );
              }
            }));
  }
}


