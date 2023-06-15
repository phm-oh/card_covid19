import 'package:flutter/material.dart';
import 'package:card_covid19/page/province.dart';

class bottomMenu extends StatefulWidget {
  const bottomMenu({super.key});

  @override
  State<bottomMenu> createState() => _bottomMenuState();
}

class _bottomMenuState extends State<bottomMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const province()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'แยกตามจังหวัด',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.school),
        //   label: 'แยกตามจังหวัด',
        // ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
