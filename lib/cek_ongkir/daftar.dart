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
        child: Padding(padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Pos Indonesia
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
                              'Jane',
                              style: TextStyle(
                              
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'website',
                              style: TextStyle(
                              
                                fontSize: 16.0,
                      
                              ),
                            ),
                         
                            Text(
                              '+62817298197 \n john.doe@example.com',
                              style: TextStyle(
                               
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        ],)
                      
                    ),



                    
                  ],

                ),
                )
              ],
            ),
          )],
        ),
        
      )
              ),
    
    );
      
    
      
    
  }
}
