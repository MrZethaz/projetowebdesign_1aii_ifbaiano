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
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Improve your smartphone:",
                  style: TextStyle(
                      fontSize:
                          36 * MediaQuery.of(context).devicePixelRatio / 3,
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
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.6),
      itemBuilder: (context, index) {
        return CustomCard(
          onTap: () {
            Navigator.of(context).pushNamed("/blankoptimization");
          },
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      labels[index],
                      style: TextStyle(
                          fontSize:
                              24 * MediaQuery.of(context).devicePixelRatio / 3,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Image(
                        image: AssetImage(images[index]),
                        height: height * 0.1,
                        width: height * 0.1,
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
      },
    );
  }
}
