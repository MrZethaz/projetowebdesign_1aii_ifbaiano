import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscuredPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Container(
                  height: 350,
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0x0099ff).withOpacity(1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(500),
                              bottomRight: Radius.circular(500),
                            )),
                      ),
                      Positioned(
                        child: Image.asset(
                          "assets/images/illustration03.png",
                          height: 300,
                        ),
                        top: 0,
                        left: 0,
                        right: 0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    children: [
                      Column(
                        children: _getTextFields(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      _getLoginButton(),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/blankregister");
                            },
                            child: Text(
                              "ou crie uma conta",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                SvgPicture.asset(
                  "assets/images/wave01.svg",
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.fill,
                )
              ],
            )),
      ]),
    ));
  }

  _saveLoginAndGoHome() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("login", _emailController.text);
    sh.setString("password", _passwordController.text);
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  _getLoginButton() {
    return InkWell(
      onTap: () {
        _saveLoginAndGoHome();
      },
      child: Ink(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.withOpacity(0.6),
                  blurRadius: 32,
                  spreadRadius: 2)
            ]),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getTextFields() {
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16), child: Icon(Icons.email)),
          labelText: "Email",
        ),
      ),
      SizedBox(
        height: 16,
      ),
      TextField(
        controller: _passwordController,
        obscureText: _obscuredPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          suffixIcon: GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(_obscuredPassword
                      ? Icons.visibility_off
                      : Icons.visibility)),
              onTap: () {
                setState(() {
                  _obscuredPassword = !_obscuredPassword;
                });
              }),
          labelText: "Password",
        ),
      )
    ];
  }
}
