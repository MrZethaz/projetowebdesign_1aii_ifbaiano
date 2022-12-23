import 'package:flutter/material.dart';
import 'package:projeto_webdesign/Widgets/CustomCard.dart';

class Clean extends StatefulWidget {
  const Clean({super.key});

  @override
  State<Clean> createState() => _CleanState();
}

class _CleanState extends State<Clean> {
  late double height;
  List<String> images = [
    "assets/images/clean.png",
    "assets/images/optimize.png",
    "assets/images/applications.png",
    "assets/images/tips.png"
  ];

  List<String> labels = ["Clean", "Optimize", "Apps", "Tips"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Improve your smartphone:",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      shadows: [
                        Shadow(
                            blurRadius: 36,
                            color: Colors.blue.withOpacity(0.5),
                            offset: Offset(3, 3))
                      ]),
                ),
                SizedBox(
                  height: 32,
                ),
                _getGridButtons(height)
              ],
            ),
          ),
        ),
      )),
    );
  }

  _getGridButtons(double height) {
    return Wrap(
      runSpacing: 16,
      spacing: 16,
      direction: Axis.vertical,
      children: [
        Wrap(
          runSpacing: 16,
          spacing: 16,
          direction: Axis.horizontal,
          children: [
            _getEachCard(0),
            _getEachCard(1),
          ],
        ),
        Wrap(
          runSpacing: 16,
          spacing: 16,
          direction: Axis.horizontal,
          children: [
            _getEachCard(2),
            _getEachCard(3),
          ],
        )
      ],
    );
  }

  _getEachCard(int index) {
    return CustomCard(
      onTap: () {
        Navigator.of(context).pushNamed("/blankoptimization");
      },
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              labels[index],
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              child: Image(
                image: AssetImage(images[index]),
                height: 70,
                width: 70,
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 32,
                    spreadRadius: 2)
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
