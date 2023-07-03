import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? kota_asal;
  String? kota_tujuan;
  String? berat;
  String? kurir;
  int? jarakAsal;
  int? jarakTujuan;
  int? per_km;
  String? ekspedisi;
  String? layanan;
  List<Map<String, dynamic>> listLayananPerKm = []; // Declare as instance variable


  CollectionReference provinsiCollection =
      FirebaseFirestore.instance.collection('provinsi');
  CollectionReference ekspedisiCollection =
      FirebaseFirestore.instance.collection('ekspedisi');

  // void loadData(CollectionReference ekspedisiCollection) async {
  //   try {
  //     // final QuerySnapshot<Map<String, dynamic>> ekpedisiQuery = 
  //     // await 
  //     ekspedisiCollection.get().then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           FirebaseFirestore.instance
  //             .document(doc.id)
  //             .collection("jobPost")
  //             .get()
  //             .then(...);
  //       });
  //   });
  //   } catch (e) {
  //       print('Terjadi kesalahan: $e');
  //     }
  // }

  void calculateDistance() async {
    // Cek apakah data provinsi asal dan tujuan sudah dipilih
    if (kota_asal != null && kota_tujuan != null) {
      try {
        // Query Firestore untuk mendapatkan data provinsi asal
        QuerySnapshot querySnapshot = await provinsiCollection
            .where('provinsi', isEqualTo: kota_asal)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first;
          int jarakAsalValue = doc['jarak'] as int;
          setState(() {
            jarakAsal = jarakAsalValue;
          });
          print(jarakAsal);
          String jarakAsalString = jarakAsalValue.toString();
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
          int jarakTujuanValue = doc['jarak'] as int;
          setState(() {
            jarakTujuan = jarakTujuanValue;
          });
          String jarakTujuanString = jarakTujuanValue.toString();
          print('Provinsi Tujuan: $kota_tujuan');
          print('Jarak Tujuan: $jarakTujuanString');
          
        } else {
          print('Provinsi Tujuan tidak ditemukan.');
        }

        querySnapshot = await ekspedisiCollection
            .where('ekspedisi', isEqualTo: kurir)
            .get();

         querySnapshot.docs.forEach((doc) {
          listLayananPerKm.clear();
  var ekspedisi = doc['ekspedisi'];
  var layanan = doc['layanan'];
  var per_km = doc['per_km'];

  setState(() {
    ekspedisi = doc['ekspedisi'];
    layanan = doc['layanan'];
    per_km = doc['per_km'];

    // Menambahkan data ke list
    listLayananPerKm.add({
      'ekspedisi': ekspedisi,
      'layanan': layanan,
      'per_km': per_km,
    });
  });

  print('Layanan untuk kurir $kurir ditemukan dalam ekspedisi ${doc.id}');
  print(listLayananPerKm);
  print(doc);
});



      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Cek Ongkir"),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 255, 23, 68),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                                const SizedBox(height: 5.0),
                        Text(
                          'Asal Pengiriman',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: 
                              DropdownButton<String>(
                                
                                borderRadius: BorderRadius.circular(15.0),
                                underline: SizedBox.shrink(),
                                isExpanded: true,
                                value: kota_asal,
                                hint: const Text("Asal Pengiriman"),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    kota_asal = newValue;
                                    calculateDistance();
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
                                  // daftar provinsi lainnya
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Tujuan Pengiriman',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                  
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: 
                            DropdownButton<String>(
          
                          borderRadius: BorderRadius.circular(15.0),
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          value: kota_tujuan,
                          hint: const Text("Tujuan Pengiriman"),
                          onChanged: (String? newValue) {
                            setState(() {
                              kota_tujuan = newValue;
                              calculateDistance();
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
                            // daftar provinsi lainnya
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                  
                        ),
                  
                  
                        const SizedBox(height: 5.0),
                        Text(
                          'Berat',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        TextField(
                          decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Berat (kg)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            berat = value;
                          },
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Pilih Kurir',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                  
                              Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: 
                              DropdownButton<String>(         
                          borderRadius: BorderRadius.circular(15.0),
                          underline: SizedBox.shrink(),
                          isExpanded: true,
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
                            // daftar kurir lainnya
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ), 
                                  
                        ),
                      ],
                    ),
                  ), 
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 23, 68),
                  ),
                  onPressed: () {
                    // validasi
                    if (kota_asal == null ||
                        kota_tujuan == null ||
                        berat == null ||
                        kurir == null) {
                      final snackBar =
                          SnackBar(content: const Text("Isi bidang yang masih kosong"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    // proses saving data
                    calculateDistance();
                    print('Apaa');
                    print(listLayananPerKm.length);

                    // Navigasi ke halaman detail dengan membawa data yang diperlukan
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: {
                        'kota_asal': kota_asal,
                        'kota_tujuan': kota_tujuan,
                        'berat': berat,
                        'kurir': kurir,
                        'jarakAsal': jarakAsal,
                        'jarakTujuan': jarakTujuan,
                        'layanan': layanan,
                        'per_km': per_km,
                        'ekspedisi' : ekspedisi,
                        'listLayananPerkm' : listLayananPerKm,
                      },
                    );
                  },
                  child: const Text('CEK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
