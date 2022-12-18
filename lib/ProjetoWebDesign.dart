import 'package:flutter/material.dart';
import 'package:projeto_webdesign/screens/Home.dart';

ThemeData theme = ThemeData.light()
    .copyWith(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue));
ThemeData darkTheme = ThemeData.dark()
    .copyWith(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue));

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;

  ThemeMode get themeMode => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toogleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
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
      darkTheme: darkTheme,
      themeMode: appTheme.themeMode,
      home: Home(),
    );
  }
}
