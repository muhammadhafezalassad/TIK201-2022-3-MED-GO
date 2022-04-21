import 'package:flutter/material.dart';
import 'package:med_go/main.dart';
import 'package:med_go/ui/pages/home_page.dart';
import 'package:med_go/ui/pages/order_page.dart';

class ObatPage extends StatefulWidget {
  const ObatPage({Key? key}) : super(key: key);

  @override
  State<ObatPage> createState() => _ObatPageState();
}

class _ObatPageState extends State<ObatPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: 'Cari Obat',
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            showCursor: true,
            cursorHeight: 20,
          ),
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
        body: ListView(
          children: [
            ListApotek(
              gambar: './assets/banda.jpg',
              nama: 'Apotek Kimia Farma',
              deskripsi: 'Darussalam, Banda Aceh',
            ),
            ListApotek(
              gambar: './assets/kimia.jpg',
              nama: 'Apotek Banda Farma',
              deskripsi: 'Baiturahman, Banda Aceh',
            ),
            ListApotek(
              gambar: './assets/sehat.jpg',
              nama: 'Apotek Cinta Sehat',
              deskripsi: 'Baiturahman, Banda Aceh',
            ),
            ListApotek(
              gambar: './assets/laris.jpg',
              nama: 'Apotek Laris 2',
              deskripsi: 'Peunayong, Banda Aceh',
            ),
            ListApotek(
              gambar: './assets/rakan.jpg',
              nama: 'Apotek Rakan Medical',
              deskripsi: 'Kuta Alam, Banda Aceh',
            ),
          ],
        ),
      ),
    );
  }
}

class ListApotek extends StatelessWidget {
  ListApotek(
      {required this.gambar, required this.nama, required this.deskripsi});

  final String gambar;
  final String nama;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Card(
            child: Row(
              children: [
                Image(
                  image: AssetImage(gambar),
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          deskripsi,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ObatPage()));
          },
        ));
  }
}
