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

  List<String> apiLink = [
    "https://api.whatsapp.com/send?phone=+(number phone)&text=Olá!",
    "https://api.whatsapp.com/send?phone=+(number phone)&text=Olá!",
    "https://api.whatsapp.com/send?phone=+(number phone)&text=Olá!",
  ];

  List<String> images = [
    "assets/images/a.png",
    "assets/images/d.png",
    "assets/images/e.png"
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Column(children: [
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
        AnimatedPositioned(
            child: GestureDetector(
              onVerticalDragDown: (details) {
                setState(() {
                  _showDownTopDescription = false;
                });
              },
              child: _getDownTopDescription(),
            ),
            curve: Curves.easeOutQuint,
            bottom: _showDownTopDescription
                ? currentClicked < 3
                    ? 0
                    : -250
                : -250,
            left: 0,
            right: 0,
            duration: Duration(milliseconds: 1000)),
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
                child: Image.asset(images[index]),
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
              child: Image.asset(images[currentClicked]),
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
                  fontWeight: FontWeight.w700),
            )),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(32)),
          ),
          onTap: () {
            launchUrlString(apiLink[currentClicked]);
          },
        )
      ]),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
    );
  }
}
