import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Drawer.dart';
import 'package:flutter/services.dart' show rootBundle;
import './Display.dart';

class IndexNum extends StatefulWidget {
  @override
  _IndexNumState createState() => _IndexNumState();
}

class _IndexNumState extends State<IndexNum> {
  var list = [];
  @override
  void initState() {
    super.initState();
    loadList();
  }

  loadList() async {
    var raw = await rootBundle.loadString('assets/song-titles.json');
    var songs = json.decode(raw);
    setState(() {
      list = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "H1",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff9966),
          elevation: 0,
          title: Text("Songs list"),
          centerTitle: true,
        ),
        drawer: DrawerCustom("Index"),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffff9966),
              Color(0xffff5e62),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: list.length,
              itemBuilder: (BuildContext c, int i) {
                return GestureDetector(
                  child: ListitemCust(list[i]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Display(i + 1)));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ListitemCust extends StatelessWidget {
  var title;
  ListitemCust(this.title);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffff7c3d),
          Color(0xffffa64c),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'oswinFont',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
