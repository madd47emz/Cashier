import 'package:cashier/firebase/StatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatRepo{
  final _db = FirebaseFirestore.instance;
  String message = "";
  createStat(Stat stat)async{
    await _db.collection("dayIncom").add(stat.toJson()).whenComplete((){ message= "Added";}).onError((error, stackTrace){ message = "error";throw "error";});

  }
  Future<List<Stat>> getStatByMonth(Timestamp date) async {
    Timestamp startOfMonth = Timestamp.fromDate(DateTime(date.toDate().year, date.toDate().month, 1));
    Timestamp startOfNextMonth = Timestamp.fromDate(DateTime(date.toDate().year, date.toDate().month + 1, 1));

    final snapshot = await _db
        .collection("stat")
        .where("date", isGreaterThan: startOfMonth)
        .where("date", isLessThan: startOfNextMonth)
        .get();

    final stats = snapshot.docs.map((e) => Stat.fromSnapshot(e)).toList();
    return stats;
  }

}