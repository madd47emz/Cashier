import 'package:cashier/firebase/ProductModel.dart';
import 'package:flutter/material.dart';

class stockProduct extends StatefulWidget {
  final Product product;
  stockProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<stockProduct> createState() => _stockProductState();
}

class _stockProductState extends State<stockProduct> {
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
          leading: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text("${this.widget.product.quantity}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

          ),
          title: Text(this.widget.product.name,
              style:
                  TextStyle(color: Colors.black,)),
          trailing: Icon(Icons.arrow_drop_down_outlined,color: Colors.red,),
          children: [

            Text("${this.widget.product.price} DZD", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text("${this.widget.product.id}", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text("entry date: ${this.widget.product.created}",
                style: TextStyle(color: Colors.black)),
            SizedBox(height: 10,),

            Text("expiration: ${this.widget.product.expiration}", style: TextStyle(color: Colors.black)),
            SizedBox(height: 10,),
            Text("description: ${this.widget.product.description}", style: TextStyle(color: Colors.black)),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
