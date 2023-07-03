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
                'Aceh',
                'Sumatera Utara',
                'Riau',
                'Sumatera Barat',
                'Kepulauan Riau',
                'Kepulauan Bangka Belitung',
                'Bengkulu',
                'Jambi',
                'Sumatera Selatan',
                'Lampung',
                'DKI Jakarta',
                'Banten',
                'Jawa Barat',
                'Jawa Tengah',
                'Daerah Istimewa Yogyakarta',
                'Jawa Timur',
                'Bali',
                'Kalimantan Tengah',
                'Kalimantan Utara',
                'Nusa Tenggara Barat',
                'Kalimantan Selatan',
                'Kalimantan Barat',
                'Sulawesi Selatan',
                'Sulawesi Barat',
                'Sulawesi Tengah',
                'Nusa Tenggara Timur',
                'Kalimantan Timur',
                'Sulawesi Tenggara',
                'Maluku Utara',
                'Maluku',
                'Papua Barat',
                'Gorontalo',
                'Sulawesi Utara',
                'Papua Tengah',
                'Papua',
                'Papua Barat Daya',
                'Papua Pegunungan',
                'Papua Selatan',
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
                'Aceh',
                'Sumatera Utara',
                'Riau',
                'Sumatera Barat',
                'Kepulauan Riau',
                'Kepulauan Bangka Belitung',
                'Bengkulu',
                'Jambi',
                'Sumatera Selatan',
                'Lampung',
                'DKI Jakarta',
                'Banten',
                'Jawa Barat',
                'Jawa Tengah',
                'Daerah Istimewa Yogyakarta',
                'Jawa Timur',
                'Bali',
                'Kalimantan Tengah',
                'Kalimantan Utara',
                'Nusa Tenggara Barat',
                'Kalimantan Selatan',
                'Kalimantan Barat',
                'Sulawesi Selatan',
                'Sulawesi Barat',
                'Sulawesi Tengah',
                'Nusa Tenggara Timur',
                'Kalimantan Timur',
                'Sulawesi Tenggara',
                'Maluku Utara',
                'Maluku',
                'Papua Barat',
                'Gorontalo',
                'Sulawesi Utara',
                'Papua Tengah',
                'Papua',
                'Papua Barat Daya',
                'Papua Pegunungan',
                'Papua Selatan',
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
                'sicepatexp',
                'jne',
                'j&t',
                'wahana',
                'satria',
                'lionparcel',
                'tiki',
                'pos',
                'anteraja',
                'ninja',
                'idexpress',
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
