import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:json_detail_page/hayvanlar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController controller = ScrollController();

  var TurSec = <String>[];
  String secilenTur = "Seçiniz";

  @override
  void initState() {
    super.initState();
    TurSec.add("Seçiniz");
    TurSec.add("Kedi");
    TurSec.add("Köpek");
    TurSec.add("Balık");
    TurSec.add("Kuş");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Hayvanlar")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 370,
                  height: 70,
                  child: DropdownButtonFormField<String>(
                    hint: const Text("Seçiniz"),
                    isExpanded: true,
                    value: secilenTur,
                    dropdownColor: Colors.white,
                    items: TurSec.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black)),
                        )).toList(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                    ),
                    onChanged: (String? secilenVerii) {
                      setState(() {
                        secilenTur = secilenVerii!;
                      });
                    },
                  ),
                ),
              ),
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/hayvanlar.json"),
                builder: (context, snapshot) {
                  var dataOku = jsonDecode(snapshot.data.toString());
                  if (snapshot.hasData) {
                    if (secilenTur == "Kedi") {
                      List Listele1 =
                          dataOku.where((dd) => dd["turu"] == "Kedi").toList();
                      return ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 0.5),
                                borderRadius: BorderRadius.circular((15))),
                            child: ListTile(
                                leading: Image(
                                  image: NetworkImage(Listele1[index]["image"]),
                                ),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                title: Text(Listele1[index]["isim"]),
                                subtitle: Text(Listele1[index]["turu"]),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      'HayvanlarDetay',
                                      arguments: jsonEncode(Listele1[index]));
                                }),
                          );
                        },
                        itemCount: Listele1.length,
                      );
                    } else if (secilenTur == "Köpek") {
                      List Listele2 =
                          dataOku.where((dd) => dd["turu"] == "Köpek").toList();
                      return ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 0.5),
                                borderRadius: BorderRadius.circular((15))),
                            child: ListTile(
                                leading: Image(
                                  image: NetworkImage(Listele2[index]["image"]),
                                ),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                title: Text(Listele2[index]["isim"]),
                                subtitle: Text(Listele2[index]["turu"]),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      'HayvanlarDetay',
                                      arguments: jsonEncode(Listele2[index]));
                                }),
                          );
                        },
                        itemCount: Listele2.length,
                      );
                    } else if (secilenTur == "Balık") {
                      List Listele3 =
                          dataOku.where((dd) => dd["turu"] == "Balık").toList();
                      return ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 0.5),
                                borderRadius: BorderRadius.circular((15))),
                            child: ListTile(
                                leading: Image(
                                  image: NetworkImage(Listele3[index]["image"]),
                                ),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                title: Text(Listele3[index]["isim"]),
                                subtitle: Text(Listele3[index]["turu"]),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      'HayvanlarDetay',
                                      arguments: jsonEncode(Listele3[index]));
                                }),
                          );
                        },
                        itemCount: Listele3.length,
                      );
                    } else if (secilenTur == "Kuş") {
                      List Listele4 =
                          dataOku.where((dd) => dd["turu"] == "Kuş").toList();
                      return ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 0.5),
                                borderRadius: BorderRadius.circular((15))),
                            child: ListTile(
                                leading: Image(
                                  image: NetworkImage(Listele4[index]["image"]),
                                ),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                title: Text(Listele4[index]["isim"]),
                                subtitle: Text(Listele4[index]["turu"]),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      'HayvanlarDetay',
                                      arguments: jsonEncode(Listele4[index]));
                                }),
                          );
                        },
                        itemCount: Listele4.length,
                      );
                    } else {
                      return ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 0.5),
                                borderRadius: BorderRadius.circular((15))),
                            child: ListTile(
                                leading: Image(
                                  image: NetworkImage(dataOku[index]["image"]),
                                  width: 80,
                                  height: 80,
                                ),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                title: Text(dataOku[index]["isim"]),
                                subtitle: Text(dataOku[index]["turu"]),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      'HayvanlarDetay',
                                      arguments: jsonEncode(dataOku[index]));
                                }),
                          );
                        },
                        itemCount: dataOku.length,
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Text('Failed to load');
                  } else {
                    return const Align(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
