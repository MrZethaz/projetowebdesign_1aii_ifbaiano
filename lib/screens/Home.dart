import 'package:flutter/material.dart';
import 'package:projeto_webdesign/screens/Account.dart';
import 'package:projeto_webdesign/screens/Clean.dart';
import 'package:projeto_webdesign/screens/Config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> telas = [Clean(), Account(), Config()];

  _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onSelect,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config")
        ],
      ),
    );
  }
}
