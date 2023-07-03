import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Others(),
    );
  }
}

class Others extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              color: Color.fromARGB(255, 255, 23, 68),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                Row(
                  children: [
                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundColor: Colors.white,
                    //   // Placeholder image
                    //   backgroundImage: AssetImage('assets/bg-welcome.jpg'),
                    // ),
                    SizedBox(width: 16.0),
                    Center(
                      child: Column(
                       
                        children: [
                          Text(
                            'Lacak Paket',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Satu Aplikasi Banyak Ekspedisi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Edit Profile'),
                    onTap: () {
                      // Action when "Edit Profile" is tapped
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Payment Methods'),
                    onTap: () {
                      // Action when "Payment Methods" is tapped
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('help'),
                    onTap: () {
                      // Action when "Delivery Addresses" is tapped
                    },
                  ), 
                ],
              ),
            ),
          ],
        ),
      ));
    
      
    
  }
}
