import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_go/ui/pages/firebase/item_card.dart';

class AdminPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5DABB0),
          title: Text('Tambah Obat'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                FutureBuilder<QuerySnapshot>(
                    future: users.get(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                         // children: snapshot.data!.docs.map((e) => ItemCard('nama', 'stock', onDelete: null, onUpdate: null,)).toList(),
                          
                        );
                      } 
                      else {
                        return Text('Loading');
                      }
                    }),
                SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: nameController,
                              decoration: InputDecoration(hintText: "Nama"),
                            ),
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: stockController,
                              decoration: InputDecoration(hintText: "Stock"),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color(0xFF5DABB0),
                            child: Text(
                              'Add Data',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              //// ADD DATA HERE
                              users.add({
                                'name': nameController.text,
                                //'stock': int.tryParse(stockController.text) ?? 0
                                'stock': int.tryParse(stockController.text) ?? 0
                              });
                              nameController.text = '';
                              stockController.text = '';
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
