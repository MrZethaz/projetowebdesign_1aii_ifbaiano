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

  List<String> labels = ["Clean", "Optimize", "Applications", "Tips"];
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
                      fontSize: 36,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 32,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      onTap: () {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Showing test function to button: ${labels[index]}')));
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
                                      fontSize: 24,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Image(
                                  image: AssetImage(images[index]),
                                  height: height * 0.1,
                                  width: height * 0.1,
                                ),
                              ]),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
