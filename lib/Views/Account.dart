import 'package:cashier/Views/utils/accountCard.dart';
import 'package:cashier/Views/utils/stockProduct.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              "Store Account",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          label: const Text('Add Transaction'),
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //states
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AccountCard("Total Revenue", "200.0 DZD", 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AccountCard("Product in Stock", "1000", 15),
                            AccountCard("Cashed bill", "50", 15),
                          ],
                        )
                      ]),
                )),

            //chart
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8)),
                  height: 250,
                  width: double.infinity,
                  child: SfCartesianChart(),
                )),
            //split
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Container(
                height: 1,
                color: Colors.black,
                width: double.infinity,
              ),
            ),
            //bills
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Recently Validated Bills",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,),
              ),
            ),
            //bills list
            stockProduct(),
            stockProduct(),
            stockProduct(),
            stockProduct(),
            stockProduct(),
            stockProduct(),
          ],
        )));
  }
}
