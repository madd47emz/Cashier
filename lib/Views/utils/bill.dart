import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  int _units = 100;
  double _amount = 200.toDouble();
  String _id = "968509686904586";
  DateTime _validation= DateTime(2021,5,8,12,20);
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
        child: ExpansionTile(



          leading: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text("${_units}",style: TextStyle(color: Colors.white),)),),
          title: Text(_id,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
          subtitle: Text("${_validation}",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
          trailing: Text("${_amount} DZD",style: TextStyle(color: Colors.green)),
          backgroundColor: Colors.redAccent.withOpacity(0.5),


          children: [
            Text("${_validation}",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),


          ],
        ),
      ),
    );
  }
}
