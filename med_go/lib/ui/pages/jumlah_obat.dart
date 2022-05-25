import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:med_go/ui/pages/admin/berandaAdmin_page.dart';
import 'package:med_go/ui/pages/admin/user_model.dart';
import 'package:med_go/ui/pages/firebase/ViewObat_page.dart';
import 'package:med_go/ui/pages/notifikasi_page.dart';
import 'package:med_go/ui/pages/notifikasi_pesan.dart';

class JumlahObatFix extends StatefulWidget {
  const JumlahObatFix({Key? key}) : super(key: key);

  @override
  State<JumlahObatFix> createState() => _JumlahObatFixState();
}

class _JumlahObatFixState extends State<JumlahObatFix> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loginUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  TextEditingController noRM = new TextEditingController();
  TextEditingController dataRM = new TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          new MaterialPageRoute(
                              builder: (context) => new ViewObat()),
                        );
                      },
                      icon: Image(image: AssetImage('assets/back.png')),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage('assets/title.png')),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Image(image: AssetImage('assets/user.png')),
                Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 14,
                      color: Color(0xff000000)),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      padding: new EdgeInsets.only(
                        right: 10.0,
                        left: 10,
                      ),
                      child: TextFormField(
                        controller: noRM,
                        onSaved: (value) {
                          noRM.text = value!;
                        },
                        decoration: InputDecoration(
                          //fillColor: Color(0xffF1F0F5),
                          //filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff989898), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff989898), width: 2.0),
                          ),
                          labelText: 'Nama Obat',
                          labelStyle: TextStyle(
                              color: Color(0xff989898),
                              fontFamily: 'PoppinsRegular',
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Container(
                      width: 300,
                      padding: new EdgeInsets.only(
                        right: 10.0,
                        left: 10,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: dataRM,
                        onSaved: (value) {
                          dataRM.text = value!;
                        },
                        decoration: InputDecoration(
                          //fillColor: Color(0xffF1F0F5),
                          //filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff989898), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff989898), width: 2.0),
                          ),
                          labelText: 'Jumlah',
                          labelStyle: TextStyle(
                              color: Color(0xff989898),
                              fontFamily: 'PoppinsRegular',
                              fontSize: 12),
                        ),
                      ),
                    ),
                ],
          
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: IconButton(
                      onPressed: () {
                        filter(noRM.text, dataRM.text);
                        Navigator.push(
                          context, 
                          new MaterialPageRoute(
                              builder: (context) => new NotifikasiObat()),
                        );
                      },
                      icon: Image(image: AssetImage('assets/buy.png')),
                      iconSize: 150,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void filter(String rekammedis, String dataRMpasien) async {
    final hasil = await FirebaseFirestore.instance.collection('obatpesan');
    Map<String, String> dataRMupdate = {"dataRM": dataRMpasien};
    hasil.doc(user!.uid).set({"namaobat":rekammedis,"stock":dataRMpasien,"nama":loginUser.nama});
var i = Random().nextInt(100);
    FirebaseFirestore.instance.collection(user!.uid).doc(i.toString()).set({"namaobat":rekammedis,"stock":dataRMpasien,"nama":loginUser.nama});
  }
}