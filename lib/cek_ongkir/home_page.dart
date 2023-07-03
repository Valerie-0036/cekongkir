import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  CollectionReference provinsiCollection =
      FirebaseFirestore.instance.collection('provinsi');
  CollectionReference ekspedisiCollection =
      FirebaseFirestore.instance.collection('ekspedisi');
  
  
  void checkEkspedisiFields() async {
    // Cek apakah data provinsi asal dan tujuan sudah dipilih
    if (kota_asal != null && kota_tujuan != null) {
      try {
        // Query Firestore untuk mendapatkan data provinsi asal
        QuerySnapshot querySnapshot = await provinsiCollection
            .where('provinsi', isEqualTo: kota_asal)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first;
          int jarakAsal = doc['jarak'] as int;
          String jarakAsalString = jarakAsal.toString();
          print('Provinsi Asal: $kota_asal');
          print('Jarak Asal: $jarakAsalString');
        } else {
          print('Provinsi Asal tidak ditemukan.');
        }

        // Query Firestore untuk mendapatkan data provinsi tujuan
        querySnapshot = await provinsiCollection
            .where('provinsi', isEqualTo: kota_tujuan)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first;
          int jarakTujuan = doc['jarak'] as int;
          String jarakTujuanString = jarakTujuan.toString();
          print('Provinsi Tujuan: $kota_tujuan');
          print('Jarak Tujuan: $jarakTujuanString');
        } else {
          print('Provinsi Tujuan tidak ditemukan.');
        }

        querySnapshot = await ekspedisiCollection
            .where('ekspedisi', isEqualTo: kurir)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first;
          print('Layanan untuk kurir $kurir ditemukan dalam ekspedisi ${doc.id}');
        } else {
          print('Daftar Kurir tidak ditemukan.');
        }
      }
      catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }
  }

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
                // proses saving data 
                checkEkspedisiFields();

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
