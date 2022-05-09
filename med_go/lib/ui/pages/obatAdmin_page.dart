import 'package:med_go/ui/pages/admin/add_page.dart';
import 'package:med_go/ui/pages/admin/edit_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:med_go/ui/pages/get_started_page.dart';
import 'package:med_go/ui/pages/jumlah_obat.dart';
import 'package:med_go/ui/pages/signin_page.dart';

void main() {
  runApp(const obatAdmin());
}

class obatAdmin extends StatefulWidget {
  const obatAdmin({Key? key}) : super(key: key);

  @override
  State<obatAdmin> createState() => _MyAppState();
}

class _MyAppState extends State<obatAdmin> {
  Future getData() async {
    var url = "http://10.0.2.2:8080/my_obat/getdata.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 61, 116, 120),
        appBar: AppBar(
          title: const Text('Edit Obat'),
          centerTitle: true,
          backgroundColor: Color(0xFF5DABB0),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SignInPage()));
            },
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: Color(0xFF5DABB0),
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ),
              );
            },
          );
        }),
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
                                leading: GestureDetector(
                                  child: const Icon(Icons.edit),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditPage(
                                          index: index,
                                          list: list,
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
                                trailing: GestureDetector(
                                  child: const Icon(Icons.delete),
                                  onTap: () {
                                    setState(() {
                                      var url =
                                          "http://10.0.2.2:8080/my_obat/deleteData.php";
                                      http.post(
                                        Uri.parse(url),
                                        body: {
                                          'id': list[index]['id'],
                                        },
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                           
                          ),
                        );
                      },
                    )
                  : const CircularProgressIndicator();
            }),
      ),
    );
  }
}
