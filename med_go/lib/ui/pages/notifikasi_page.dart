import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/admin/user_model.dart';
import 'package:med_go/ui/pages/beranda.dart';
import 'package:med_go/ui/pages/obat_model.dart';
import 'package:med_go/ui/widgets/custome_button.dart';
import 'home_page.dart';
import 'notif_page.dart';
import 'account_page.dart';

class NotifikasiObat extends StatefulWidget {
  const NotifikasiObat({Key? key}) : super(key: key);

  @override
  State<NotifikasiObat> createState() => _NotifikasiObatState();
}

class _NotifikasiObatState extends State<NotifikasiObat> {
  User? user = FirebaseAuth.instance.currentUser;
  ObatModel obat = ObatModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("obatpesan")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.obat = ObatModel.fromMap(value.data());
      print(obat.stock);
      setState(() {});
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeColor,
      appBar: AppBar(
        title: Text("Riwayat Pemesanan"),
        backgroundColor : kPrimeColor,
         leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Beranda()),
                          );
            },
          ),
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
                    child: Column(children: [Text(
                      'Nama Pemesan : ${obat.nama}',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),Text(
                      'Nama Obat : ${obat.namaobat}',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Jumlah Obat : ${obat.stock}',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    ],)
                  ),
                  SizedBox(height:50),
              CustomeButton(
              width: 230,
              title: 'Batalkan Pemesanan',
              onPressed: () {
                FirebaseFirestore.instance.collection('obatpesan').doc(user!.uid).delete();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Beranda()));
              },
              color: kWhiteColor,
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