import 'package:cashier/Views/utils/counterProduct.dart';
import 'package:flutter/material.dart';

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
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Scan barcode'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              list.add(CounterProduct());
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Purchase",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              onLongPress: () async {
                var response = await
                showDialog<String>(
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
                                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                ),
                              )
                            ]));
                if(response=="OK"){
                  setState(() {
                    list = [];total = 0;
                  });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Added to account")));}
              },
              child: Text(
                "${total} DZD",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
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
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: list.length,
        ));
  }
}
