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
        elevation: 16,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: GestureDetector(
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
            ),
            Text(_name,style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${_price} DZD",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
            )


          ],
        ),
      ),
    );
  }
}
