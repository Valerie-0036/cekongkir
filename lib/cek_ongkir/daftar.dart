import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Daftar(),
    );
  }
}

class Daftar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Daftar Ekspedisi"),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //POS Indonesia
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage: AssetImage('assets/pos.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'POS INDONESIA',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'posindonesia.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '161 \n halopos@posindonesia.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //Sicepat
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/sicepat.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sicepat',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'sicepat.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2150200050 \n customer.care@sicepat.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //JNE
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage: AssetImage('assets/jne.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'JNE',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'jne.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2129278888 \n customercare@jne.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //JNT
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage: AssetImage('assets/jnt.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'JNT',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'jet.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2180661888 \n jntcare.jet.co.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //Wahana
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/wahana.jpg'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wahana',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'wahana.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)217541688 \n info@wahana.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //SAP
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage: AssetImage('assets/sap.jpg'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SAP',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'sap-express.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2122806611 \n info@sap-express.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //Lion Parcel
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/lionparcel.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lion Parcel',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'lionparcel.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2122580868 \n sales@lionparcel.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //TIKI
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/tiki.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TIKI',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'tiki.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+1500125 \n tiki@tiki.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/anteraja.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Anteraja',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'anteraja.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2150603333 \n cs@anteraja.id',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //Ninja Xpress
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/ninja.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ninja',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'ninjaxpress.co',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2129264120 \n support_id@ninjavan.co',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        //ID Express
                        Container(
                            color: Color.fromARGB(255, 238, 238, 238),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  // Placeholder image
                                  backgroundImage:
                                      AssetImage('assets/idexpress.png'),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID Express',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'idexpress.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '+(62)2180823899 \n info@idexpress.com',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
