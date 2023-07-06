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
  final List<Map<String, dynamic>>? listLayananPerKm1;
  final List<Map<String, dynamic>>? listLayananPerKm2;

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
    this.listLayananPerKm1,
    this.listLayananPerKm2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Map<String, dynamic> arguments1 = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> listLayananPerKm1 = arguments['listLayananPerkm1'];
    final Map<String, dynamic> arguments2 = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> listLayananPerKm2 = arguments['listLayananPerkm2'];

    String? kotaAsalValue = kotaAsal;
    String? kotaTujuanValue = kotaTujuan;
    String? beratBarangValue = berat;
    int? jarakAsalValue = jarakAsal;
    int? jarakTujuanValue = jarakTujuan;
    String? layanan = layananValue;
    int? per_km = perKmValue;
    String? ekspedisi = ekspedisiValue;
    List<Map<String, dynamic>> listLayananPerKm1Value = listLayananPerKm1 ?? [];
    List<Map<String, dynamic>> listLayananPerKm2Value = listLayananPerKm2 ?? [];

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
      listLayananPerKm1Value = arguments1['listLayananPerKm1'] ?? [];
      listLayananPerKm2Value = arguments2['listLayananPerKm2'] ?? [];
      
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
                  // Ekspedisi lainnya
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                        Text(
                          "${listLayananPerKm1[0]['ekspedisi'] }",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        for (int i = 0; i < listLayananPerKm1.length; i++) ...[
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("${listLayananPerKm1[i]['layanan']} "),
                            Spacer(),
                            Text(
                              "Rp. ${listLayananPerKm1[i]['per_km'] * (jarakTujuanValue ?? 0) * int.tryParse(beratBarangValue!)}",
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
                    ],
                  ),
                  if (listLayananPerKm2.isNotEmpty) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                        Text(
                          "${listLayananPerKm2[0]['ekspedisi'] }",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        for (int i = 0; i < listLayananPerKm2.length; i++) ...[
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("${listLayananPerKm2[i]['layanan']} "),
                            Spacer(),
                            Text(
                              "Rp. ${listLayananPerKm2[i]['per_km'] * (jarakTujuanValue ?? 0) * int.tryParse(beratBarangValue!) }",
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
                    ],
                  ),
                  ],
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
