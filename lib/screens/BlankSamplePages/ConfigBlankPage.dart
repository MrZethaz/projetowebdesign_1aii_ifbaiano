import 'package:flutter/material.dart';

class ConfigBlankPage extends StatelessWidget {
  const ConfigBlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text("Blank page to represent configuration pages",
              style: TextStyle(fontSize: 20))),
    );
  }
}
