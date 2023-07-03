import 'package:cekongkir/cek_ongkir/others.dart';
import 'package:cekongkir/cek_ongkir/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeBar());
}

class HomeBar extends StatefulWidget {
  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int currentIndex=0;
  final screens=[
HomePage(),
Others(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    // extendBodyBehindAppBar: true,
    body: screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(99, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 255, 23, 68),
        currentIndex: currentIndex,
        type : BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: (index) => setState(()=>currentIndex= index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Cek Ongkir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lainnya',
          ),
        ],
        

      ),
  );

}