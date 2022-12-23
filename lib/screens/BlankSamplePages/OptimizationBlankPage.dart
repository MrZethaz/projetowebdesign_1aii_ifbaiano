import 'package:flutter/material.dart';

class OptimizationBlankPage extends StatelessWidget {
  const OptimizationBlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        "Blank page to represent optimization pages",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
