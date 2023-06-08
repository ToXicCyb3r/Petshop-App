import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petshop/screens/theme.dart';
import 'package:petshop/widgets/petshop_card.dart';
import 'package:petshop/models/menu.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class MainNavigator extends StatefulWidget{
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState  extends State<MainNavigator>{

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom: 10),
          child: GNav(tabs: const [
          GButton(icon: Icons.home,
            text: 'Home',
          ),
          GButton(icon: Icons.search,
            text: 'Find',),
          GButton(icon: Icons.person,
            text: 'Profil',
           ),
        ],
            onTabChange: (index){setState(() {
              _selectedIndex = index;
            });},
      ),

    ),
    ),
    );
  }
}