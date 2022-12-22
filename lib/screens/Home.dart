import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';
import 'package:projeto_webdesign/screens/Account.dart';
import 'package:projeto_webdesign/screens/Clean.dart';
import 'package:projeto_webdesign/screens/Config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> telas = [Clean(), Account(), Config()];
  bool loggedIn = false;

  late SharedPreferences sh;

  _getSh() async {
    sh = await SharedPreferences.getInstance();
    bool isDark = sh.getBool("isDark") ?? true;
    appTheme.setTheme(isDark: isDark);
  }

  _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future getLogin() async {
    SharedPreferences refs = await SharedPreferences.getInstance();
    bool login = refs.containsKey("login");
    loggedIn = login;
    print(login);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSh();
  }

  @override
  Widget build(BuildContext context) {
    getLogin().then((value) => {
          if (!loggedIn)
            {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/login", (route) => false)
            }
        });

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
