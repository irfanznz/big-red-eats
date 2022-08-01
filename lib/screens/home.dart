import 'dart:math';

import 'package:big_red_eats/screens/tab_account.dart';
import 'package:big_red_eats/screens/tab_eateries.dart';
import 'package:big_red_eats/screens/tab_upcoming_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tabList = [
    EateriesTab(),
    UpcomingMenusTab(),
    AccountTab(),
  ];
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[25],
      body: tabList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueAccent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Eatery List',
            icon: Icon(Icons.dining),
          ),
          BottomNavigationBarItem(
            label: 'Upcoming Meals',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person_rounded),
          ),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
