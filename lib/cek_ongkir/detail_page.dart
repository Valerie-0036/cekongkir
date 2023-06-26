import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, kota_asal,  kota_tujuan,  berat,  kurir}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // Menerima argumen data dari halaman sebelumnya
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Cek Ongkir"),
      ),
      body: Center(
        child: Text(
          "Kota Asal: ${args['kota_asal']}\nKota Tujuan: ${args['kota_tujuan']}\nBerat: ${args['berat']} gram\nKurir: ${args['kurir']}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
