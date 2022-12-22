import 'package:flutter/material.dart';
import 'package:projeto_webdesign/screens/AboutUs.dart';
import 'package:projeto_webdesign/screens/ConfigBlankPage.dart';
import 'package:projeto_webdesign/screens/Home.dart';
import 'package:projeto_webdesign/screens/Login.dart';
import 'package:projeto_webdesign/screens/OptimizationBlankPage.dart';
import 'package:projeto_webdesign/screens/RegisterBlankPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, accentColor: Colors.blue));
ThemeData themeDark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, accentColor: Colors.blue));

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;
  bool system = false;

  ThemeMode get themeMode => system
      ? ThemeMode.system
      : isDarkTheme
          ? ThemeMode.dark
          : ThemeMode.light;

  AppTheme() {
    getThemeFromSh();
  }
  void toogleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  void setTheme({required bool isDark}) {
    isDarkTheme = isDark;
    notifyListeners();
  }

  void setSystem({required bool system}) {
    this.system = system;
    notifyListeners();
  }

  getThemeFromSh() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    bool? dark = sh.getBool("isDark");
    isDarkTheme = dark! ? true : false;
  }
}

AppTheme appTheme = AppTheme();

class ProjetoWebDesign extends StatefulWidget {
  const ProjetoWebDesign({super.key});

  @override
  State<ProjetoWebDesign> createState() => _ProjetoWebDesignState();
}

class _ProjetoWebDesignState extends State<ProjetoWebDesign> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appTheme.addListener(() {
      //👈 this is to notify the app that the theme has changed
      setState(
          () {}); //👈 this is to force a rerender so that the changes are carried out
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: themeDark,
      themeMode: appTheme.themeMode,
      initialRoute: "/home",
      routes: {
        "/home": (context) => Home(),
        "/login": (context) => LoginPage(),
        "/blankconfig": (context) => ConfigBlankPage(),
        "/blankoptimization": (context) => OptimizationBlankPage(),
        "/blankregister": (context) => RegisterBlankPage(),
        "/aboutus": (context) => AboutUs()
      },
    );
  }
}
