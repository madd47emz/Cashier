import 'package:cashier/firebase/BillModel.dart';
import 'package:cashier/firebase/ProductModel.dart';
import 'package:flutter/material.dart';

class BillTile extends StatefulWidget {
  final Bill bill;
  BillTile({Key? key, required this.bill}) : super(key: key);

  @override
  State<BillTile> createState() => _BillTileState();
}

class _BillTileState extends State<BillTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.all(15),
          title: Text("${this.widget.bill.date}",
              style: TextStyle(
                color: Colors.black,
              )),
          trailing: Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.red,
          ),
          children: [
            Text("${this.widget.bill.total} DZD", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            ListView.builder(
              itemCount: this.widget.bill.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${this.widget.bill.products[index].quantity}"),
                  title: Text(
                    "${this.widget.bill.products[index].name}",
                  ),
                  trailing: Text(
                    "${this.widget.bill.products[index].price} DZD",
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
