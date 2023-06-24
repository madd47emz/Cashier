import 'package:cashier/Views/utils/counterProduct.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double total = 100;
  List<CounterProduct> list = [CounterProduct()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () async {
                var response = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('Cash in'),
                            content:
                                const Text('Do you want to confirm purshase'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                    style: TextStyle(color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]));
                if (response == "OK") {
                  setState(() {
                    list = [];
                    total = 0;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added to account"),backgroundColor: Colors.red,));
                }
              },
              label: Text(
                "${total} DZD",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.green,
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    setState(() {});
                  }
                });
              },
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Counter",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      {
                        // statements;
                      }
                      break;

                    case 2:
                      {
                        //statements;
                      }
                      break;

                    default:
                      {
                        //statements;
                      }
                      break;
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("bayd"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Jirika maa"),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text("khobz"),
                      ),
                    ]),
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          itemCount: list.length,
        ));
  }
}
