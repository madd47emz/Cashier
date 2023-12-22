

import 'package:cashier/firebase/ProductModel.dart';
import 'package:cashier/firebase/ProductRepo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class RegisterProd extends StatefulWidget {
  const RegisterProd({Key? key}) : super(key: key);

  @override
  State<RegisterProd> createState() => _RegisterProdState();
}

class _RegisterProdState extends State<RegisterProd> {
  final productRepo repo = productRepo();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController barcodeInput = TextEditingController();
  String _name = '';
  int _qte = 30;
  final _padding = const EdgeInsets.symmetric(horizontal: 10);
  final _filledColor = Colors.white;
  final _h = 50.0;
  final _formKey = GlobalKey<FormState>();

  DateTime _experation = DateTime(2023);

  double _price = 0;
  @override
  void initState() {
    dateInput.text = "";
    barcodeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Register Product",
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            label: const Text(
              'Register',
              style: TextStyle(color: Colors.red),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            onPressed: () async {
              var response = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: const Text('Add to Inventory'),
                          content: const Text('Do you want to create product'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
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
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                        color: Colors.white),
                  ),
                );
                await repo.createProduct(Product(id: barcodeInput.text, name: _name, price: _price, description: "no discription is here", quantity: _qte, expiration: _experation, created: DateTime.now()));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(repo.message),backgroundColor: Colors.red,duration: Duration(seconds: 5),));
                Navigator.pop(context);
              }
            }),
        body: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //heading

                //name
                Padding(
                  padding: _padding,
                  child: Container(
                    height: _h,
                    child: TextFormField(

                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.red),
                      cursorColor: Colors.red,
                      onChanged: (value)=>_name=value,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.red),
                        filled: true,
                        enabled: true,
                        hintText: "Name",
                        fillColor: _filledColor,
                      ),
                    ),
                  ),
                ),
                //quantity + unit price
                Container(
                  height: _h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //unit price
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            onChanged: (value)=>_price=double.parse(value),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.red),
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.red),
                              filled: true,
                              enabled: true,
                              fillColor: _filledColor,
                              hintText: 'Unit Price',
                            ),
                          ),
                        ),
                      ),
                      //quantity
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _controller,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.red),
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.red),
                              filled: true,
                              enabled: true,
                              fillColor: _filledColor,
                              hintText: 'Quantity',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //quantity slider
                Container(
                  height: _h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Quantity",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: Colors.white)),
                      ),
                      Slider(
                          value: _qte.toDouble(),
                          min: 1,
                          max: 150,
                          divisions: 10,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.8),
                          label: '${_qte.toInt()}',
                          onChanged: (double newValue) {
                            setState(() {
                              _qte = newValue.toInt();
                              _controller.text = _qte.toString();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue}';
                          }),
                    ],
                  ),
                ),
                //barcode scanner
                Padding(
                  padding: _padding,
                  child: Container(
                    height: _h,
                    child: TextFormField(
                      controller: barcodeInput,
                      readOnly: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.red),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.document_scanner,
                          color: Colors.red,
                        ),
                        hintStyle: TextStyle(color: Colors.red),
                        hintText: "bar code",
                        filled: true,
                        fillColor: _filledColor,
                      ),
                      onTap: () async {
                        var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SimpleBarcodeScannerPage(),
                            ));
                        setState(() {
                          if (res is String) {
                            barcodeInput.text = res;
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                ),
                //expitation date
                Padding(
                  padding: _padding,
                  child: Container(
                    height: _h,
                    child: TextFormField(
                      controller: dateInput,
                      readOnly: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.red),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.red,
                        ),
                        hintStyle: TextStyle(color: Colors.red),
                        hintText: "experation",
                        filled: true,
                        fillColor: _filledColor,
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          _experation = pickedDate;
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate);
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Must add Expiration Date!!!")));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
