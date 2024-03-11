import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/pages/home_page.dart';
import 'package:create_challenge_ios_app/pages/message_page.dart';
import 'package:create_challenge_ios_app/pages/info_card_page.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const MessageForm(),
    const InfoCardPage(),
    const Icon(
      Icons.chat,
      size: 150,
    ),
    const Icon(
      Icons.chat,
      size: 150,
    ),
// Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem navBarItem(IconData passiveIcon, IconData activeIcon) {
    return BottomNavigationBarItem(
      icon: Icon(passiveIcon, size: 50),
      activeIcon: Icon(activeIcon, size: 50),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
        child: _pages.elementAt(_selectedIndex),
),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[

          navBarItem(Icons.home_outlined, Icons.home),
          navBarItem(Icons.chat_outlined, Icons.chat),
          navBarItem(Icons.contact_emergency_outlined, Icons.contact_emergency),
          navBarItem(Icons.bar_chart_outlined, Icons.bar_chart),
          navBarItem(Icons.settings_outlined, Icons.settings),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}