import 'package:flutter/material.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';

class CustomCard extends StatelessWidget {
  Widget? child;
  VoidCallback onTap;
  CustomCard({this.child = null, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onTap: onTap,
      child: Ink(
        child: child,
        decoration: BoxDecoration(
            color: /*appTheme.isDarkTheme ? darkTheme.cardColor : theme.cardColor*/ Colors
                .blue,
            /*
            border: appTheme.isDarkTheme
                ? Border.all(color: Colors.white24)
                : Border.all(color: Colors.black26),*/
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 1)
            ]),
      ),
    );
  }
}
