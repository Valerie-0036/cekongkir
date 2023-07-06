import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String? kota_asal;
  String? kota_tujuan;
  String? berat;
  int? jarakAsal;
  int? jarakTujuan;
  int? per_km;
  String? ekspedisi;
  String? layanan;
  static const int _count = 11;
  final List<bool> _checks = List.generate(_count, (_) => false);
  final kurir1=[
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
  ];
  List<String> selectedKurir = [];
  List<Map<String, dynamic>> listLayananPerKm1 = [];
  List<Map<String, dynamic>> listLayananPerKm2 = [];



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
    setState(() {
      isLoading = true;
    });

    try {
      // Query Firestore untuk mendapatkan data provinsi asal dan tujuan
      QuerySnapshot querySnapshot = await provinsiCollection
          .where('provinsi', whereIn: [kota_asal, kota_tujuan])
          .get();

      // Process data provinsi asal
      if (querySnapshot.docs.isNotEmpty) {
        var asalDocs = querySnapshot.docs.where((doc) => doc['provinsi'] == kota_asal);
        if (asalDocs.isNotEmpty) {
          var asalDoc = asalDocs.first;
          int jarakAsalValue = asalDoc['jarak'] as int;
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
      }

      // Process data provinsi tujuan
      if (querySnapshot.docs.isNotEmpty) {
        var tujuanDocs = querySnapshot.docs.where((doc) => doc['provinsi'] == kota_tujuan);
        if (tujuanDocs.isNotEmpty) {
          var tujuanDoc = tujuanDocs.first;
          int jarakTujuanValue = tujuanDoc['jarak'] as int;
          setState(() {
            jarakTujuan = jarakTujuanValue;
          });
          String jarakTujuanString = jarakTujuanValue.toString();
          print('Provinsi Tujuan: $kota_tujuan');
          print('Jarak Tujuan: $jarakTujuanString');
        } else {
          print('Provinsi Tujuan tidak ditemukan.');
        }
      }

      // Query Firestore untuk mendapatkan data ekspedisi berdasarkan kurir yang dipilih
      querySnapshot = await ekspedisiCollection
          .where('ekspedisi', whereIn: selectedKurir)
          .get();

      // Process data ekspedisi
      listLayananPerKm1.clear();
      listLayananPerKm2.clear();

      for (var doc in querySnapshot.docs) {
        var ekspedisi = doc['ekspedisi'];
        var layanan = doc['layanan'];
        var perKm = doc['per_km'];

        if (ekspedisi == selectedKurir[0]) {
          // Menambahkan data ke listLayananPerKm1
          listLayananPerKm1.add({
            'ekspedisi': ekspedisi,
            'layanan': layanan,
            'per_km': perKm,
          });
        } else {
          // Menambahkan data ke listLayananPerKm2
          listLayananPerKm2.add({
            'ekspedisi': ekspedisi,
            'layanan': layanan,
            'per_km': perKm,
          });
        }
      }
    } catch (e) {
      print('Error: $e');
      // Handle error gracefully, e.g., show a snackbar or alert dialog
    } finally {
      setState(() {
        isLoading = false;
      });
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
      body: SingleChildScrollView(
        child: Padding(
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
                                      isLoading = true;
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
                                isLoading = true;
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
                            onChanged: (String? newValue) {
                              setState(() {
                                isLoading = true;
                                berat = newValue;
                                calculateDistance();
                              });
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
                    
                    GridView.builder(
                      shrinkWrap: true,
          itemCount: _count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                
                children: [
                  Container(color: Colors.white),
                  // Container(color: Colors.red[(i * 100) % 900]),
                  Center(
                    child: Column(
                      children:[
                        
                      Checkbox(
  value: _checks[i],
  onChanged: (bool? newValue) {
    setState(() {
      isLoading = true;

      if (newValue == true && selectedKurir.length >= 2) {
        // Maximum two checkboxes already selected, so prevent selecting more
        _checks[i] = false;
        return;
      }

      _checks[i] = newValue ?? false;

      if (_checks[i]) {
        selectedKurir.add(kurir1[i]);
      } else {
        selectedKurir.remove(kurir1[i]);
      }

      calculateDistance();
    });
  },
),


                      Text(kurir1[i]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
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
                      bool isLoading = true;
                      // validasi
                      if (kota_asal == null ||
                          kota_tujuan == null ||
                          berat == null || selectedKurir.length == 0
                          ) {
                        final snackBar =
                            SnackBar(content: const Text("Isi bidang yang masih kosong"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      // proses saving data
                      calculateDistance();
                      

                      // Navigasi ke halaman detail dengan membawa data yang diperlukan
                      Future<void> navigateWithDelay() async {
  await Future.delayed(Duration(seconds: 3), () {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: {
        'kota_asal': kota_asal,
        'kota_tujuan': kota_tujuan,
        'berat': berat,
        'jarakAsal': jarakAsal,
        'jarakTujuan': jarakTujuan,
        'layanan': layanan,
        'per_km': per_km,
        'ekspedisi' : ekspedisi,
        'listLayananPerkm1' : listLayananPerKm1,
        'listLayananPerkm2' : listLayananPerKm2,
      },
    );
  });
}
navigateWithDelay();
                    },
                    child: const Text('CEK'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}