import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';

class Cuci extends StatelessWidget {
  const Cuci({Key? key}) : super(key: key);

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
                      '1. Basahi kedua tangan kamu dari telapak tangan sampai pertengahan lengan dengan air bersih yang mengalir.\n2. Tuangkan sabun secukupnya dan oleskan ke kedua tangan kamu hingga menutupi seluruh permukaan tangan.\n3. Gosok kedua telapak dan punggung tangan kamu secara bergantian. Jangan lupa gosok juga jari-jari tangan dan sela-sela jari sampai bersih. Lalu, bersihkan juga bagian bawah kuku. Bersihkan kedua ibu jari tangan dengan cara menggenggam dan memutar ibu jari secara bergantian.\n4. Bilas tangan dengan baik di bawah air bersih yang mengalir.\n5. Keringkan tangan dengan menggunakan handuk bersih atau di bawah hand dryer.',
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
