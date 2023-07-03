import 'package:cekongkir/cek_ongkir/loginscreen.dart';
import 'package:cekongkir/cek_ongkir/signup_screen.dart';
import 'package:cekongkir/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cekongkir/cek_ongkir/detail_page.dart';
import 'package:cekongkir/cek_ongkir/home_page.dart';
import 'package:cekongkir/cek_ongkir/homebar.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp(), 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Ongkos Kirim',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false, 
      // Definisikan rute
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) =>  DetailPage(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/homebar': (context) => HomeBar(),
      },
      initialRoute: '/homebar',
    );
  }
}
