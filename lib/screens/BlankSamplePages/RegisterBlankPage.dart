import 'package:flutter/material.dart';

class RegisterBlankPage extends StatelessWidget {
  const RegisterBlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text("Blank page to represent registering pages",
              style: TextStyle(fontSize: 20))),
    );
  }
}
