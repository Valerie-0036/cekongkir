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
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            Container(
              
              color: Color.fromARGB(255, 202, 202, 202),
              child:   Column(
                          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            
                children: [
                  Text("Asal Pengiriman"),
                  Text("${kotaAsalValue ?? 'Unknown'}"
                  ,style:TextStyle(fontWeight:FontWeight.bold),),
                  const SizedBox(height: 10.0,),
                  Text("Tujuan Pengiriman: ${kotaTujuanValue ?? 'Unknown'}"),
                  Text("${kotaTujuanValue ?? 'Unknown'}"
                  ,style:TextStyle(fontWeight:FontWeight.bold),),
                  const SizedBox(height: 10.0,),
                ],
              ),
            ),
              // Add other necessary UI elements
        
              Container(
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,


                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        const SizedBox(height: 20.0,),
                      Text("TIKI", style: TextStyle(fontWeight:FontWeight.bold),),
                      const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Text("ECO",),
                              Spacer(),
                              Text("Rp 16.000",style: TextStyle(
                                color: Color.fromARGB(255, 255, 23, 68),
                              ) ,),
                              const SizedBox(width: 20.0,),        
                            ],
                          ),
                                                const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Text("ECO",),
                              Spacer(),
                              Text("Rp 16.000",style: TextStyle(
                                color: Color.fromARGB(255, 255, 23, 68),
                              ) ,),
                              const SizedBox(width: 20.0,),        
                            ],
                          ),
                    ],
                    ),
                    
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        const SizedBox(height: 20.0,),
                      Text("Sicepat", style: TextStyle(fontWeight:FontWeight.bold),),
                      const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Text("ECO",),
                              Spacer(),
                              Text("Rp 16.000",style: TextStyle(
                                color: Color.fromARGB(255, 255, 23, 68),
                              ) ,),
                              const SizedBox(width: 20.0,),        
                            ],
                          ),
                                                const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Text("ECO",),
                              Spacer(),
                              Text("Rp 16.000",style: TextStyle(
                                color: Color.fromARGB(255, 255, 23, 68),
                              ) ,),
                              const SizedBox(width: 20.0,),        
                            ],
                          ),
                    ],
                    ),
                    ],
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


