import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_detail_page/HomePage.dart';
import 'package:json_detail_page/hayvanlar.dart';

class HayvanDetay extends StatefulWidget {
  const HayvanDetay({Key? key}) : super(key: key);

  @override
  _HayvanDetayState createState() => _HayvanDetayState();
}

class _HayvanDetayState extends State<HayvanDetay> {
  var productName = "";
  Hayvanlar? product;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var productString = ModalRoute.of(context)?.settings.arguments as String;

    var productJson = jsonDecode(productString);

    setState(() {
      product = Hayvanlar.fromJson(productJson);
      productName = product!.isim!;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Card(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image(
                          image: NetworkImage(product!.image!),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text((product!.isim.toString()),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                        )),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Türü : ${product!.turu}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: Text(product!.aciklama!.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              "Anasayfa",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
