import 'package:flutter/material.dart';
import './Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "H1",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff9966),
          elevation: 0,
        ),
        drawer: DrawerCustom("Settings"),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffff9966),
              Color(0xffff5e62),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: <Widget>[OswSlide()],
            ),
          ),
        ),
      ),
    );
  }
}

class OswSlide extends StatefulWidget {
  @override
  _OswSlideState createState() => _OswSlideState();
}

class _OswSlideState extends State<OswSlide> {
  var startValuel = 20.0;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double d = await prefs.getDouble('fontSize') ?? 20;
    setState(() {
      startValuel = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    savePref(v) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('fontSize', v);
    }

    return Card(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text("Select text size : " + startValuel.toString()),
            SizedBox(
              height: 10,
            ),
            Slider(
              
              value: startValuel,
              min: 10,
              max: 40,
              onChanged: (v) {
                setState(() {
                  startValuel = v.floorToDouble();
                });

                savePref(v.floorToDouble());
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "J}a> J}a> J}a> rj;jpNaf Njth!",
              style: TextStyle(fontFamily: 'oswinFont', fontSize: startValuel),
            )
          ],
        ),
      ),
    );
  }
}
