import 'package:flutter/material.dart';
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/widgets/custome_button.dart';
import 'package:med_go/main.dart';
import 'package:med_go/ui/pages/home_page.dart';
import 'package:med_go/ui/pages/obat_page.dart';
import 'package:med_go/ui/pages/notifikasi_pesan.dart';

class JumlahPage extends StatefulWidget {
  const JumlahPage({Key? key}) : super(key: key);

  @override
  State<JumlahPage> createState() => _JumlahPageState();
}

class _JumlahPageState extends State<JumlahPage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _DecrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jumlah Obat dipesan"),
        backgroundColor: Color(0xFF5DABB0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ObatPage()));
          },
        ),
      ),
      backgroundColor: kWhiteColor,
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
                    image: AssetImage('assets/panadol.png'),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Jumlah obat yang ingin dipesan',
                    textAlign: TextAlign.center,
                    style: whiteStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Tambah Obat',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            CustomeButton(
              width: 180,
              textcolor: kWhiteColor,
              title: 'Pesan',
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new NotifPage()),
                );
              },
              color: kPrimeColor,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
<<<<<<< HEAD
      floatingActionButton: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
            heroTag: null,
            backgroundColor: Color(0xFF5DABB0),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'increment',
            child: const Icon(Icons.add),
            heroTag: null,
            backgroundColor: Color(0xFF5DABB0),
          ),
        ],
      ),
      //
=======
      floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton( backgroundColor: kPrimeColor,
        child: Icon(
          Icons.add
        ),
        onPressed: () =>_incrementCounter(),
        heroTag: null,
      ),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton( backgroundColor: kPrimeColor,           
        child: Icon(
          Icons.delete,
        ),
        onPressed: () => _DecrementCounter(),
        heroTag: null,
      )
    ]
  )
>>>>>>> main
    );
}}
