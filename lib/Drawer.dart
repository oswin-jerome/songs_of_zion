import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  var screenName;
  DrawerCustom(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      padding: EdgeInsets.only(left: 0, top: 40),
      child: ListView(
        children: <Widget>[
          GestureDetector(
            child: DrawItem("Home", screenName == "Home"),
            onTapUp: (d) {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          GestureDetector(
            child: DrawItem("Index", screenName == "Index"),
            onTapUp: (d) {
              Navigator.pushReplacementNamed(context, '/numIndex');
            },
          ),
          GestureDetector(
            child: DrawItem("Alphabetical index", screenName == "Aplha"),
            onTapUp: (d) {
              Navigator.pushReplacementNamed(context, '/alphaIndex');
            },
          ),
          GestureDetector(
            child: DrawItem("Settings", screenName == "Settings"),
            onTapUp: (d) {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
          GestureDetector(
            child: DrawItem("About", screenName == "About"),
            onTapUp: (d) {
              Navigator.pushReplacementNamed(context, '/about');
            },
          ),
          // DrawItem("About", false),
        ],
      ),
    );
  }
}

class DrawItem extends StatelessWidget {
  var title;
  var col;
  DrawItem(this.title, this.col);
  @override
  Widget build(BuildContext context) {
    var value = 0xffff9966;
    return Container(
      child: Text(
        title,
        style: TextStyle(
            color: col ? Colors.white : Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(15),
      color: Color(col ? value : 0xffffffff),
    );
  }
}
