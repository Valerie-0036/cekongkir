import 'package:firebase_auth/firebase_auth.dart';
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

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
    print('User telah keluar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        leading: BackButton(),
        title: const Text("Lainnya"),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
      ),
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

                  SizedBox(height: 8.0),
                  ListTile(
                    leading: Icon(Icons.add_box),
                    title: Text('Daftar Ekspedisi'),
                    onTap: () {
                      // Action when "Edit Profile" is tapped
                      Navigator.pushReplacementNamed(context, '/daftar');
                    },
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.payment),
                  //   title: Text('Payment Methods'),
                  //   onTap: () {
                  //     // Action when "Payment Methods" is tapped
                  //   },
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.help),
                  //   title: Text('help'),
                  //   onTap: () {
                  //     // Action when "Delivery Addresses" is tapped
                  //   },
                  // ), 
                  ElevatedButton(
                      onPressed: (){
                        _signOut(context);
                      },
                      child: Text('Log Out'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(int.parse('D7224F', radix: 16)).withOpacity(1.0), // Warna oranye
                        minimumSize: Size(double.infinity, 48.0),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ));
    
      
    
  }
}
