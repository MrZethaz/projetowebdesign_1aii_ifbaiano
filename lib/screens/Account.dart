import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: _getUserBanner(),
          height: MediaQuery.of(context).size.height / 2.8,
          top: 0,
          left: 0,
          right: 0,
        ),
        Positioned(
          child: _getUserConfigListView(),
          top: MediaQuery.of(context).size.height / 2.8,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).size.height / 2.8,
          left: 0,
          right: 0,
        )
      ],
    ));
  }

  _getUserConfigListView() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text(
            "User configuration",
            style: TextStyle(fontSize: 20),
          ),
          children: [
            _getTile("Change name"),
            _getTile("Change password"),
            _getTile("Change profile picture"),
            _getTile("2-step verification"),
            _getTile("Delete account"),
          ],
        ),
        ExpansionTile(
          title: Text(
            "Payment",
            style: TextStyle(fontSize: 20),
          ),
          children: [
            ExpansionTile(
              title: Text(
                "Get plan",
                style: TextStyle(fontSize: 20),
              ),
              children: [
                _getTile("Plans"),
                _getTile("Use serial code"),
              ],
            ),
            _getTile("Payment methods"),
            _getTile("Refund policies"),
            _getTile("School plan"),
          ],
        ),
        _getTile("More apps"),
        _getTile(
          "Invite friends",
          onTap: () {
            Share.share(
                "Clean App is the best cleaner for your's smartphone,\n\ncheck it now at: ( example url )");
          },
        ),
        _getTile(
          "Exit account",
          onTap: () {
            _exitAccount();
          },
        )
      ],
    );
  }

  _exitAccount() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("login");
    sh.remove("password");
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  _getUserBanner() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200 * MediaQuery.of(context).devicePixelRatio / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 36,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.4))
                ])),
            ListTile(
              title: Text(
                "Apollo Daniel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        24 * MediaQuery.of(context).devicePixelRatio / 3.5),
              ),
              subtitle: Text(
                "Gosta de limpar o celular!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        18 * MediaQuery.of(context).devicePixelRatio / 3.5),
              ),
            )
          ]),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.8),
                blurRadius: 36,
                spreadRadius: 1)
          ]),
    );
  }

  _getTile(String _name, {VoidCallback? onTap}) {
    return ListTile(
      title: Row(children: [
        Text(
          _name,
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: Container()),
        Text(
          ">",
          style: TextStyle(fontSize: 24),
        )
      ]),
      onTap: () {
        onTap == null
            ? Navigator.of(context).pushNamed("/blankconfig")
            : onTap();
      },
    );
  }
}
