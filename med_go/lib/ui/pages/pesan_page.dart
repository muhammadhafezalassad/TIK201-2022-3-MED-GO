import 'package:flutter/material.dart';
import 'package:med_go/main.dart';
import 'package:med_go/ui/pages/home_page.dart';
import 'package:med_go/ui/pages/obat_page.dart';

class PesanPage extends StatefulWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  State<PesanPage> createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Obat'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ObatPage()));
          },
        ),
      ),
    );
  }
}
