import 'package:cloud_firestore/cloud_firestore.dart';

class Stat {
  DateTime date;
  double totalIncome;

  Stat({
    required this.date,
    required this.totalIncome,
  });

  factory Stat.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data()!;
    return Stat(
      date: DateTime.parse(json['date']),
      totalIncome: json['totalIncome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': Timestamp.fromDate(date),
      'totalIncome': totalIncome,
    };
  }
}
