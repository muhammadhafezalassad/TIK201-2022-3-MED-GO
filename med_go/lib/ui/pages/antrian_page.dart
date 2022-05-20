import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/admin/user_model.dart';
import 'package:med_go/ui/pages/obat_model.dart';
import 'home_page.dart';
import 'notif_page.dart';
import 'account_page.dart';

class Antrian extends StatefulWidget {
  Antrian({Key? key}) : super(key: key);

  @override
  State<Antrian> createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
  User? user = FirebaseAuth.instance.currentUser;
  ObatModel obat = ObatModel();
  List daftarobat = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("obatpesan").get().then((value) {
          value.docs.forEach((element) {
            final data = element.data();
            daftarobat.add(data);
           });
        setState(() {});
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeColor,
      appBar: AppBar(
        title: Text("Notifikasi Pemesanan"),
        backgroundColor : kPrimeColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Image(image: AssetImage('assets/white_title.png')),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 45,
                right: 45,
                bottom: 50,
              ),
              margin: const EdgeInsets.only(top: 45, bottom: 40),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Obat yang dipesan',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(children: [
                      ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: daftarobat.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        daftarobat[index]['nama'],
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      ),
                      subtitle: Text(
                        "Antrian : ${daftarobat[index]['namaobat']}",
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular', fontSize: 14),
                      ),
                    );
                  },
                ),
                    ],)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //@override
  //Widget build(BuildContext context) {
    //return Container(
      //child: Row(
        //children: [
          //Text('${obat.nama}')
        //],
      //),
    //);
  }