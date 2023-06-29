import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Account.dart';
import 'Counter.dart';
import 'Inventory.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _current,
        children: [
          Counter(),
          Inventory(),
          Account(),
        ],
      ),
      backgroundColor: Colors.redAccent,
      bottomNavigationBar: GNav(

        selectedIndex: _current,
        onTabChange: (index)=> setState(() {
          _current = index;
        }),

          backgroundColor: Colors.red,
          color: Colors.white,
          activeColor: Colors.white,
          tabs: [
            GButton(icon: Icons.add_shopping_cart,text: "Counter",),
            GButton(icon: Icons.account_balance,text: "Stock",),
            GButton(icon: Icons.account_balance_wallet_outlined,text: "Account",),
          ]),
    );
  }
}
