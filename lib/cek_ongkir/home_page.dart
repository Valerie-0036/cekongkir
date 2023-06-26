import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String? kota_asal;
  String? kota_tujuan;
  String? berat;
  String? kurir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cek Ongkir"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: kota_asal,
              hint: const Text("Pilih Kota Asal"),
              onChanged: (String? newValue) {
                setState(() {
                  kota_asal = newValue;
                });
              },
              items: <String>[
                'Jakarta',
                'Bandung',
                'Surabaya',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: kota_tujuan,
              hint: const Text("Pilih Kota Tujuan"),
              onChanged: (String? newValue) {
                setState(() {
                  kota_tujuan = newValue;
                });
              },
              items: <String>[
                'Surabaya',
                'Bandung',
                'Jakarta',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Berat (gram)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                berat = value;
              },
            ),
            DropdownButton<String>(
              value: kurir,
              hint: const Text("Pilih Kurir"),
              onChanged: (String? newValue) {
                setState(() {
                  kurir = newValue;
                });
              },
              items: <String>[
                'JNE',
                'POS Indonesia',
                'TIKI',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // validasi
                if (kota_asal == null || kota_tujuan == null || berat == null || kurir == null) {
                  final snackBar = SnackBar(content: const Text("Isi bidang yang masih kosong"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                // Navigasi ke halaman detail dengan membawa data yang diperlukan
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: {
                    'kota_asal': kota_asal,
                    'kota_tujuan': kota_tujuan,
                    'berat': berat,
                    'kurir': kurir,
                  },
                );
              },
              child: const Text('Cek Ongkir'),
            ),
          ],
        ),
      ),
    );
  }
}
