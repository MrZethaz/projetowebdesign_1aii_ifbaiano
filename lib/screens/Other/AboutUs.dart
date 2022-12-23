import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool apolloClicked = false;
  bool diamilliClicked = false;
  bool emersonClicked = false;

  List<Uri> apiLink = [
    Uri.parse("https://api.whatsapp.com/send?phone=5538998570760&text=Olá!"),
    Uri.parse("https://api.whatsapp.com/send?phone=5538998570760&text=Olá!"),
    Uri.parse("https://api.whatsapp.com/send?phone=5538998570760&text=Olá!"),
  ];

  List<Image> images = [
    Image.asset("assets/images/a.png"),
    Image.asset("assets/images/d.png"),
    Image.asset("assets/images/e.png")
  ];
  List<String> labels = ["Apollo", "Participante 2", "Participante 3"];
  List<String> descriptions = [
    "Responsável pela programação e implementação do projeto!",
    "Responsável pela estruturação do aplicativo",
    "Responsável pela estilização e sugestões de design do projeto"
  ];
  bool _showDownTopDescription = false;

  int currentClicked = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(AssetImage("assets/images/a.png"), context);
    precacheImage(AssetImage("assets/images/d.png"), context);
    precacheImage(AssetImage("assets/images/e.png"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showDownTopDescription = false;
            });
          },
          child: Scaffold(
            appBar: AppBar(),
            body: Column(children: [
              Expanded(flex: 1, child: Container()),
              _getProfilePictureAndDescription(index: 0),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _getProfilePictureAndDescription(index: 1),
                  _getProfilePictureAndDescription(index: 2)
                ],
              ),
              Expanded(flex: 2, child: Container()),
            ]),
          ),
        ),
        AnimatedPositioned(
            child: GestureDetector(
              child: _getDownTopDescription(),
            ),
            curve: Curves.easeOutQuint,
            bottom: _showDownTopDescription
                ? currentClicked < 3
                    ? 0
                    : -253
                : -253,
            left: 0,
            right: 0,
            duration: Duration(milliseconds: 1000))
      ]),
    );
  }

  _getProfilePictureAndDescription({required int index}) {
    return Center(
      child: Column(
        children: [
          Text(
            labels[index],
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentClicked = index;
                _showDownTopDescription = true;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              child: ClipRRect(
                child: images[index],
                borderRadius: BorderRadius.circular(32),
              ),
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.height / 5,
            ),
          )
        ],
      ),
    );
  }

  _getDownTopDescription() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(children: [
        ListTile(
            leading: ClipRRect(
              child: images[currentClicked],
              borderRadius: BorderRadius.circular(32),
            ),
            title: Text(
              labels[currentClicked],
              style: TextStyle(fontSize: 36),
            ),
            subtitle: Text(
              descriptions[currentClicked],
              style: TextStyle(fontSize: 18),
            )),
        SizedBox(
          height: 32,
        ),
        GestureDetector(
          child: Container(
            height: 50,
            child: Center(
                child: Text(
              "Contatar",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            )),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(32)),
          ),
          onTap: () async {
            Uri url = apiLink[currentClicked];
            bool can = await canLaunchUrl(url);
            print(can);
            if (can) {
              await launchUrl(url,
                  mode: LaunchMode.externalNonBrowserApplication);
            }
          },
        )
      ]),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.fromBorderSide(BorderSide(
              color: Colors.blue, width: 3, strokeAlign: StrokeAlign.outside)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
    );
  }
}
