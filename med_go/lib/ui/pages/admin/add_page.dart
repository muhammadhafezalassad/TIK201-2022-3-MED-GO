import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:med_go/ui/pages/obatAdmin_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _EditPageState();
}

class _EditPageState extends State<AddPage> {
  late TextEditingController namaItem;
  late TextEditingController stock;
  late TextEditingController price;
  late TextEditingController id;

  bool editMode = false;

  addUpdateData() {
    var url = "http://10.0.2.2:8080/my_obat/add.php";
    http.post(
      Uri.parse(url),
      body: {
        'item_name': namaItem.text,
        'stock': stock.text,
        'price': price.text,
        'id': id.text,
      },
    );
  }

  @override
  void initState() {
    namaItem = TextEditingController(text: '');
    stock = TextEditingController(text: '');
    price = TextEditingController(text: '');
    id = TextEditingController(text: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(editMode ? 'Update' : 'Add Data'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => obatAdmin()));
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: namaItem,
                decoration: InputDecoration(labelText: 'Nama Obat'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: stock,
                decoration: InputDecoration(labelText: 'Stock'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: price,
                decoration: InputDecoration(labelText: 'Price'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: TextField(
            //     controller: id,
            //     decoration: InputDecoration(labelText: 'id'),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        addUpdateData();
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => obatAdmin(),
                      ),
                    );
                  },
                  child: Text(
                    editMode ? 'Update' : 'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
