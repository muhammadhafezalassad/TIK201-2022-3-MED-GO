import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_go/ui/pages/admin/signinAdmin_page.dart';
import 'package:med_go/ui/pages/admin/signupAdmin_page.dart';
import 'package:med_go/ui/pages/get_started_page.dart';
import 'package:med_go/ui/pages/home_page.dart';
import 'package:med_go/ui/pages/order_page.dart';
import 'package:med_go/ui/pages/signin_page.dart';
import 'package:med_go/ui/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const GetStartedPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/order':(context) => const OrderPage(),
        '/signinadmin': (context) => const SignInAdminPage(),
        '/signupadmin': (context) => const SignUpAdminPage(),
      },
    );}}