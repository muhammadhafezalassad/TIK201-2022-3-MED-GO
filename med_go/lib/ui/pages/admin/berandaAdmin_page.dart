import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/admin/account_page.dart';
import 'package:med_go/ui/pages/admin/edit_page.dart';
import 'package:med_go/ui/pages/beranda.dart';
import 'package:med_go/ui/widgets/custome_button.dart';
import 'package:med_go/ui/pages/firebase/crud_page.dart';
import 'package:med_go/ui/pages/firebase/ViewObat_page.dart';

class berandaAdmin extends StatelessWidget {
  const berandaAdmin({Key? key}) : super(key: key);

  get index => null;

  get list => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 256,
                width: 260,
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            CustomeButton(
              width: 230,
              title: 'Edit Obat',
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new crudPage()),
                );
              },
              color: kWhiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeButton(
              width: 230,
              title: 'Notifikasi',
              onPressed: () {},
              color: kWhiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeButton(
              width: 230,
              title: 'Profil',
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ProfileAdmin()),
                );
              },
              color: kWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
