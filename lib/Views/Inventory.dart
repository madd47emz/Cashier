import 'package:cashier/Views/Register_Prod.dart';
import 'package:cashier/Views/utils/stockProduct.dart';
import 'package:cashier/Views/search.dart';
import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<stockProduct> list= [
    stockProduct()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Create Product'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
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
                      delegate: CustomSearchDelegate()
                  );
                },
                icon: const Icon(Icons.search),
              ),
            )
  ],
        ),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
          itemCount: list.length,
        ));
  }
}


