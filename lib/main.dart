import 'package:cashier/Views/Account.dart';
import 'package:cashier/Views/Register_Prod.dart';
import 'package:cashier/Views/splash.dart';
import 'package:flutter/material.dart';

import 'Views/Dash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cashier',
      home: SplashScreen(),
    );
  }
}
