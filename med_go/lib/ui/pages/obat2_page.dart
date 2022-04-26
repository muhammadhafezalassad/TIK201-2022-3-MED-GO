import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:med_go/ui/pages/jumlah_obat.dart';
import 'package:med_go/ui/pages/order_page.dart';
import 'package:med_go/ui/pages/pesan_page.dart';

void main() {
  runApp(const DatabaseObat());
}

class DatabaseObat extends StatefulWidget {
  const DatabaseObat({Key? key}) : super(key: key);

  @override
  State<DatabaseObat> createState() => _MyAppState();
}

class _MyAppState extends State<DatabaseObat> {
  Future getData() async {
    var url = "http://10.0.2.2:8080/my_obat/getdata.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pilih Obat'),
          centerTitle: true,
          backgroundColor: Color(0xFF5DABB0),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => OrderPage()));
            },
          ),
        ),
        body: FutureBuilder<dynamic>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return Container(
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                            splashColor: Colors.teal,
                            child: Card(
                              child: ListTile(
                                title: Text(list[index]['item_name']),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Stock : ${list[index]['stock']}",
                                    ),
                                    Text("Rp. ${(list[index]['price'])}")
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          JumlahPage()));
                            },
                          ),
                        );
                      },
                    )
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
