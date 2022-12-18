import 'package:flutter/material.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';

class CustomCard extends StatelessWidget {
  Widget? child;
  CustomCard({this.child = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: appTheme.isDarkTheme ? darkTheme.cardColor : theme.cardColor,
          border: appTheme.isDarkTheme
              ? Border.all(color: Colors.white24)
              : Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(32)),
    );
  }
}
