import 'package:cashier/firebase/BillModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillRepo{
  final _db = FirebaseFirestore.instance;
  String message = "";
  createBill(Bill bill)async{
    await _db.collection("bills").add(bill.toJson()).whenComplete((){ message= "Added";}).onError((error, stackTrace){ message = "error";throw "error";});
  }

  Future<List<Bill>> getAll()async {
    final snapshot = await _db.collection("bills").get();
    final bills = snapshot.docs.map((e) => Bill.fromSnapshot(e)).toList();
    return bills;

  }
}