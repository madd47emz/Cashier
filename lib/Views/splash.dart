import 'package:cashier/Views/Dash.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
// ignore: avoid_print
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dash()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Icon(
                size: 90,
                Icons.countertops,
                color: Colors.red,

              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,

              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ]),
    ));
  }
}
