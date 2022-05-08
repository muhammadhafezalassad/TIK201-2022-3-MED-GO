import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/signin_page.dart';
import 'package:med_go/ui/widgets/custome_button.dart';
import 'beranda.dart';
import 'user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController nama = new TextEditingController();
  final TextEditingController nohp = new TextEditingController();
  final TextEditingController alamat = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 66,
                width: 276,
                margin: const EdgeInsets.only(
                  top: 120,
                  bottom: 50,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/title.png'),
                  ),
                ),
              ),
            ),
            Text(
              'Daftar Akun',
              style: greenStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            TextFormField(
              controller: nama,
              onSaved: (value){
                nama.text = value!;
              },
              decoration: InputDecoration(
                hintText: 'Nama',
                hintStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                labelText: 'Masukkan Nama',
                labelStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            TextFormField(
              controller: nohp,
              onSaved: (value){
                nohp.text = value!;
              },
              decoration: InputDecoration(
                hintText: 'Nomor Handphone',
                hintStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                labelText: 'Masukkan Nomor Handphone',
                labelStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            TextFormField(
              controller: alamat,
              onSaved: (value){
                alamat.text = value!;
              },
              decoration: InputDecoration(
                hintText: 'Alamat',
                hintStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                labelText: 'Masukkan Alamat',
                labelStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kPrimeColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: email,
              onSaved: (value){
                email.text = value!;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                labelText: 'Masukkan Email',
                labelStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kPrimeColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: password,
              onSaved: (value){
                password.text = value!;
              },
              decoration: InputDecoration(
                hintText: 'Kata Sandi',
                hintStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                labelText: 'Masukkan Kata Sandi',
                labelStyle: greenStyle.copyWith(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kPrimeColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            CustomeButton(
              textcolor: kWhiteColor,
              title: 'Daftar',
              onPressed: () {signUp(email.text, password.text);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Punya Akun?',
                  style: greenStyle.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Masuk Disini',
                    style: greenStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nama = nama.text;
    userModel.nohp = nohp.text;
    userModel.alamat = alamat.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Pendaftaran Berhasil");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const SignInPage()),
        (route) => false);
  }
}
