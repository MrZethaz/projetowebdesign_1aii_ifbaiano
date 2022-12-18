import 'package:flutter/material.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  bool darkTheme = appTheme.isDarkTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dark Theme"),
          SizedBox(
            height: 16,
          ),
          Switch(
            value: darkTheme,
            onChanged: (value) {
              appTheme.toogleTheme();
              setState(() {
                darkTheme = value;
              });
            },
          )
        ],
      )),
    );
  }
}
