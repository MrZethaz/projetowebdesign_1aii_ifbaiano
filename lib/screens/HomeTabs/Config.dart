import 'package:flutter/material.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  bool darkTheme = appTheme.isDarkTheme;
  // Initial Selected Value
  String dropdownvalue = appTheme.isDarkTheme ? 'Dark' : 'Light';

  // List of items in our dropdown menu
  var items = ['Light', 'Dark'];

  late SharedPreferences sh;

  _getSh() async {
    sh = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              _getThemeConfig(),
              _getTile("Privacy control"),
              _getTile("Quick clean"),
              _getTile("Auto-clean config"),
              _getTile("Optimization options"),
              _getTile(
                "About Us",
                onTap: () {
                  Navigator.pushNamed(context, "/aboutus");
                },
              ),
            ],
          ),
        ),
      )),
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

  _getThemeConfig() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(children: [
        Text(
          "Theme: ",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Expanded(child: Container()),
        Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: _getDropdownMenuItem(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  newValue == 'Dark'
                      ? appTheme.setTheme(isDark: true)
                      : appTheme.setTheme(isDark: false);
                  setThemeSharedPreferences();
                });
              },
              iconEnabledColor: Colors.blue,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.5,
        )
      ]),
    );
  }

  setThemeSharedPreferences() async {
    sh.setBool("isDark", appTheme.isDarkTheme);
  }

  _getDropdownMenuItem() {
    return items.map((String item) {
      return DropdownMenuItem(
        value: item,
        child: Text(item,
            style: TextStyle(
                color: item == items[items.indexOf(dropdownvalue)]
                    ? Colors.blue
                    : item == items[0]
                        ? Colors.white
                        : Colors.black)),
      );
    }).toList();
  }
}
