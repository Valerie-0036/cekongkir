import 'package:flutter/material.dart';

class DetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> listLayananPerKm = arguments['listLayananPerkm'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Jumlah data: ${listLayananPerKm.length}'),
      ),
    );
  }
}
