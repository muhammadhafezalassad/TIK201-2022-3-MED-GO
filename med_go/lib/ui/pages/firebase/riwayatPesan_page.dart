import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/services.dart";
import 'package:med_go/shared/theme.dart';
import 'package:med_go/ui/pages/admin/user_model.dart';
import 'package:med_go/ui/pages/beranda.dart';
import 'package:med_go/ui/pages/jumlah_obat.dart';
import 'package:med_go/ui/pages/order_page.dart';

class riwayatPesan extends StatelessWidget {
  const riwayatPesan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Riwayat Pemesanan',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List daftarObat = [];
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

      FirebaseFirestore.instance.collection(user!.uid).get().then((value) {
        value.docs.forEach((element) {
          //print(element.data());
          final data = element.data();
          daftarObat.add(data);

          //print(data['pasien']['nama']);
        });
        setState(() {});
      });
    });
  }

  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameObatController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('obatpesan');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['namaobat'];
      _nameObatController.text = documentSnapshot['namaobat2'];
      _stockController.text = documentSnapshot['stock'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _stockController,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? namaobat = _nameController.text;
                    final double? stock =
                        double.tryParse(_stockController.text);
                    if (namaobat != null && stock != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss
                            .add({"namaobat": namaobat, "stock": stock});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({"namaobat": namaobat, "stock": stock});
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _stockController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemesanan'),
        backgroundColor: kPrimeColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new Beranda()),
            );
          },
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: daftarObat.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(daftarObat[index]['namaobat']),
                subtitle: Text(daftarObat[index]['stock']),
              );
            })),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Riwayat Pemesanan'),
    //     backgroundColor: kPrimeColor,
    //     automaticallyImplyLeading: true,
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    //       onPressed: () {
    //         Navigator.push(
    //           context,
    //           new MaterialPageRoute(builder: (context) => new Beranda()),
    //         );
    //       },
    //     ),
    //   ),
    //   // Using StreamBuilder to display all products from Firestore in real-time
    //   body: StreamBuilder(
    //     stream: _productss.snapshots(),
    //     builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    //       if (streamSnapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: streamSnapshot.data!.docs.length,
    //           itemBuilder: (context, index) {
    //             final DocumentSnapshot documentSnapshot =
    //                 streamSnapshot.data!.docs[index];
    //             return Card(
    //               margin: const EdgeInsets.all(10),
    //               child: ListTile(
    //                 onTap: () {},
    //                 title: Text(documentSnapshot['namaobat'] ?? ''),
    //                 subtitle:
    //                     Text("Jumlah : ${documentSnapshot['stock'].toString()}"),
    //                 trailing: SizedBox(
    //                   width: 100,
    //                   child: Row(
    //                       // children: [
    //                       //   // Press this button to edit a single product
    //                       //   IconButton(
    //                       //       icon: const Icon(Icons.edit),
    //                       //       onPressed: () =>
    //                       //           _createOrUpdate(documentSnapshot)),
    //                       //   // This icon button is used to delete a single product
    //                       //   IconButton(
    //                       //       icon: const Icon(Icons.delete),
    //                       //       onPressed: () =>
    //                       //           _deleteProduct(documentSnapshot.id)),
    //                       // ],
    //                       ),
    //                 ),
    //               ),
    //             );
    //           },
    //         );
    //       }

    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),
    //   // // Add new product
    //   // floatingActionButton: FloatingActionButton(
    //   //   onPressed: () => _createOrUpdate(),
    //   //   child: const Icon(Icons.add),
    //   // ),
    // );
  }
}
