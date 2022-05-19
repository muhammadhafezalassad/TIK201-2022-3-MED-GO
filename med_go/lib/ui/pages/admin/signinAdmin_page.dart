import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/admin/berandaAdmin_page.dart';
import 'package:med_go/ui/pages/firebase/admin_page.dart';
import 'package:med_go/ui/pages/firebase/crud_page.dart';
import 'package:med_go/ui/pages/obatAdmin_page.dart';
import 'package:med_go/ui/widgets/custome_button.dart';


class SignInAdminPage extends StatefulWidget {
  const SignInAdminPage({ Key? key }) : super(key: key);

  @override
  State<SignInAdminPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInAdminPage> {
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  void signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "Login Berhasil"),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const berandaAdmin()),
              )
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
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
                  bottom: 120,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/title.png'),
                  ),
                ),
              ),
            ),
            Text(
              'Selamat Datang',
              style: greenStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
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
                suffixIcon: const Icon(
                  Icons.email,
                  color: kPrimeColor,
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
                suffixIcon: const Icon(
                  Icons.visibility,
                  color: kPrimeColor,
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
              height: 100,
            ),
            CustomeButton(
              textcolor: kWhiteColor,
              title: 'Masuk',
              onPressed: () { signIn(email.text, password.text);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            //  CustomeButton(
            //   textcolor: kWhiteColor,
            //   title: 'Admin',
            //   onPressed: () {
            //     Navigator.push(
            //               context,
            //               new MaterialPageRoute(
            //                   builder: (context) => new crudPage()),
            //             );
            //   },
            // ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum Punya Akun?',
                  style: greenStyle.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signupadmin');
                  },
                  child: Text(
                    'Daftar Disini',
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
}
