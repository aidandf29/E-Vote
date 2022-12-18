import 'package:flutter/material.dart';
import 'package:evote/pages/history.dart';
import 'package:evote/pages/home.dart';
import 'package:evote/pages/profil.dart';

class BotNavBar extends StatefulWidget {
  @override
  _NavigationBar createState() => _NavigationBar();
}

class _NavigationBar extends State<BotNavBar> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    Home(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 100,
        //backgroundColor: Color(0xFF05304B),
        //backgroundColor: Color(0xFF0094B6),
        backgroundColor: Colors.white,
        // selectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF05304B),
        unselectedItemColor: Colors.black54,
        //unselectedItemColor: Colors.white60,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(
              Icons.history,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
