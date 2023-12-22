import 'package:flutter/material.dart';

class CounterProduct extends StatefulWidget {
  final String name;
  final double price;
  int units = 1;
  CounterProduct({Key? key, required this.name, required this.price}) : super(key: key);

  @override
  State<CounterProduct> createState() => _CounterProductState();
}

class _CounterProductState extends State<CounterProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

        ),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        child: ListTile(
          leading:
            GestureDetector(
              onTap: (){
                setState(() {
                  this.widget.units++;

                });
      },
              onDoubleTap: (){
                setState(() {
                  this.widget.units > 0 ? this.widget.units--:this.widget.units = 1;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Text("${this.widget.units}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

              ),
            ),
            title:
            Text(this.widget.name,style: TextStyle(color: Colors.black)),
            trailing:

            Text("${this.widget.price} DZD",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))



        ),
      ),
    );
  }
}
