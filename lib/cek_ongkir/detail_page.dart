import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String? kotaAsal;
  final String? kotaTujuan;

  const DetailPage({Key? key,  this.kotaAsal,  this.kotaTujuan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String? kotaAsalValue = kotaAsal;
    String? kotaTujuanValue = kotaTujuan;

    if (arguments != null) {
      kotaAsalValue = arguments['kota_asal'];
      kotaTujuanValue = arguments['kota_tujuan'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Ongkir"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Provinsi Asal: ${kotaAsalValue ?? 'Unknown'}"),
            Text("Provinsi Tujuan: ${kotaTujuanValue ?? 'Unknown'}"),
            // Add other necessary UI elements
          ],
        ),
      ),
    );
  }
}


