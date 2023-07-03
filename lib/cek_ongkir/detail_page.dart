import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String? kotaAsal;
  final String? kotaTujuan;
  final String? berat;
  final int? jarakAsal;
  final int? jarakTujuan;
  final int? perKmValue;
  final String? layananValue;
  final String? ekspedisiValue;
  final List<Map<String, dynamic>>? listLayananPerKm;

  const DetailPage({
    Key? key,
    this.kotaAsal,
    this.kotaTujuan,
    this.berat,
    this.jarakAsal,
    this.jarakTujuan,
    this.layananValue,
    this.perKmValue,
    this.ekspedisiValue,
    this.listLayananPerKm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> listLayananPerKm = arguments['listLayananPerkm'];
    String namaLayanan = listLayananPerKm[0]['layanan'];
    int kmLayanan = listLayananPerKm[0]['per_km'];
    for (int i = 0; i < listLayananPerKm.length; i++) {
  String namaLayanan = listLayananPerKm[i]['layanan'];
  int kmLayanan = listLayananPerKm[i]['per_km'];
  print('Layanan: $namaLayanan, Per Km: $kmLayanan');
}

    print(listLayananPerKm.length);
    print(namaLayanan);
    print(kmLayanan);
    String? kotaAsalValue = kotaAsal;
    String? kotaTujuanValue = kotaTujuan;
    String? beratBarangValue = berat;
    int? jarakAsalValue = jarakAsal;
    int? jarakTujuanValue = jarakTujuan;
    String? layanan = layananValue;
    int? per_km = perKmValue;
    String? ekspedisi = ekspedisiValue;
    List<Map<String, dynamic>> listLayananPerKmValue = listLayananPerKm ?? [];

    if (arguments != null) {
      kotaAsalValue = arguments['kota_asal'];
      kotaTujuanValue = arguments['kota_tujuan'];
      beratBarangValue = arguments['berat'];
      jarakAsalValue = arguments['jarakAsal'];
      jarakTujuanValue = arguments['jarakTujuan'];
      layanan = arguments['layanan'];
      per_km = arguments['per_km'];
      ekspedisi = arguments['ekspedisi'];
      int hasil = ((jarakAsalValue ?? 0) - (jarakTujuanValue ?? 0)).abs();
      jarakTujuanValue = hasil;
      listLayananPerKmValue = arguments['listLayananPerKm'] ?? [];
    }

    if (listLayananPerKmValue.isNotEmpty) {
      for (var item in listLayananPerKmValue) {
        debugPrint(item.toString()); // Menggunakan debugPrint
        print(item); // Menggunakan print
        print('okeee');
      }
    } else {
      print('kosong');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Ongkir"),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Asal Pengiriman"),
                    Text(
                      "${kotaAsalValue ?? 'Unknown'}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Tujuan Pengiriman"),
                    Text(
                      "${kotaTujuanValue ?? 'Unknown'}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Berat"),
                    Text(
                      "${beratBarangValue ?? 'Unknown'}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Jarak"),
                    Text(
                      "${jarakTujuanValue ?? 'Unknown'}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              _buildDivider(),
              Column(
                children: [
                  // Tiki
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "TIKI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      for (var item in listLayananPerKmValue)
                        Row(
                          children: [
                            Text(item['layanan']),
                            Spacer(),
                            Text(
                              "Rp ${item['per_km']}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 23, 68),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                          ],
                        ),
                    ],
                  ),

                  // SICEPAT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Sicepat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // Render the Sicepat data here
                    ],
                  ),

                  // Ekspedisi lainnya
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "$ekspedisi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text("$layanan"),
                          Spacer(),
                          Text(
                            "Rp $per_km",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 23, 68),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
