import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cekongkir/cek_ongkir/loginscreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  var db = FirebaseFirestore.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Membuat objek data pengguna
    final user = {
      'username': username,
      'password': password,
    };

    try {
      // Menambahkan data pengguna ke koleksi 'users' di Firestore
      await db.collection('users').add(user);
      print('Data pengguna ditambahkan ke Firestore');
    } catch (error) {
      print('Error menambahkan data pengguna: $error');
    }

    // Setelah berhasil menambahkan data, Anda dapat melakukan navigasi ke halaman berikutnya
    // Misalnya, menggunakan Navigator.push untuk berpindah ke halaman utama aplikasi
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: loginUser,
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(),
    );
  }
}
