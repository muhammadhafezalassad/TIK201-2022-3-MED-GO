import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:med_go/ui/pages/obatAdmin_page.dart';


class EditPage extends StatefulWidget {
  final List list;
  final int index;

  EditPage({required this.list, required this.index});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController namaItem;
  late TextEditingController stock;
  late TextEditingController price;
  late TextEditingController id;

  bool editMode = false;

  addUpdateData() {
    var url = "http://10.0.2.2:8080/my_obat/edit.php";
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
    namaItem= new TextEditingController(text: widget.list[widget.index]['item_name'] );
    stock= new TextEditingController(text: widget.list[widget.index]['stock'] );
    price= new TextEditingController(text: widget.list[widget.index]['price'] );
    id= new TextEditingController(text: widget.list[widget.index]['id'] );
    // namaItem = TextEditingController(text: '');
    // stock = TextEditingController(text: '');
    // price = TextEditingController(text: '');
    // id = TextEditingController(text: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Obat'),
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
                    'Update',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
