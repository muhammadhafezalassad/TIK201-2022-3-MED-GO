import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';

class Tidur extends StatelessWidget {
  const Tidur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeColor,
      appBar: AppBar(
        title: Text("Tips Kesehatan"),
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
                      'Tips Menjaga dari Covid-19',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '1. Batasi waktu tidur siang \nDisarankan untuk membatasi waktu tidur siang, yaitu tidak lebih dari 20 menit.\n2. Hindari olahraga berat sebelum tidur\nOlahraga dapat menghasilkan efek lelah yang membuat Anda mudah terlelap. Namun, aktivitas ini juga dapat menghasilkan efek segar yang justru membuat tubuh semakin terjaga.\n3. Hindari makan berat menjelang waktu tidur\n4. Hindari mengonsumsi kopi atau merokok sebelum tidur\n5. Hindari menggunakan perangkat elektronik atau gawai sebelum tidur',
                      style: blackStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
