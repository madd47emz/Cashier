import 'package:flutter/material.dart';

class CounterProduct extends StatefulWidget {
  const CounterProduct({Key? key}) : super(key: key);

  @override
  State<CounterProduct> createState() => _CounterProductState();
}

class _CounterProductState extends State<CounterProduct> {
  var _name = "Product 1";
  double _price = 100;

  int _units = 1;
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
                  _units++;
                });
      },
              onDoubleTap: (){
                setState(() {
                  _units != 0 ? _units--:_units = 1;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Text("${_units}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

              ),
            ),
            title:
            Text(_name,style: TextStyle(color: Colors.black)),
            trailing:

            Text("${_price} DZD",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))



        ),
      ),
    );
  }
}
