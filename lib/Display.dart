import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class Display extends StatefulWidget {
  int songNumber;
  Display(this.songNumber);
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var list = [];
  var pos = 0.0;
  double fontSize = 16;
  double pre = 0.0;
  @override
  void initState() {
    super.initState();

    loadSong(widget.songNumber);
    getFs();
  }

  getFs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double d = prefs.getDouble('fontSize') ?? 30;
    setState(() {
      fontSize = d;
    });

    print(fontSize);
  }

  loadSong(songNumber) async {
    var raw = await rootBundle.loadString('assets/data.json');
    var songs = json.decode(raw);
    print(list);
    setState(() {
      list = songs[songNumber.toString()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "H1",
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(widget.songNumber.toString()),
          ),
          body: GestureDetector(
            onHorizontalDragUpdate: (a) {
              print(a.primaryDelta);
              setState(() {
                pos += a.primaryDelta ?? 0;
              });
            },
            onHorizontalDragEnd: (d) {
              if (d.primaryVelocity! > 800) {
                setState(() {
                  widget.songNumber--;
                });
                loadSong(widget.songNumber);
              } else if (d.primaryVelocity! < -800) {
                setState(() {
                  widget.songNumber++;
                });
                loadSong(widget.songNumber);
              }
            },
            onScaleUpdate: (a) {
              print(a.horizontalScale.toStringAsFixed(2));
              if (pre != a.scale.truncateToDouble()) {
                pre = double.parse(a.horizontalScale.toStringAsFixed(2));
                if (int.parse(a.horizontalScale.toStringAsFixed(2)) > 1) {
                  if (fontSize < 40) {
                    setState(() {
                      fontSize += .5;
                    });
                  }
                }

                if (int.parse(a.horizontalScale.toStringAsFixed(2)) < 1) {
                  if (fontSize > 20) {
                    setState(() {
                      fontSize -= .5;
                    });
                  }
                }
              }
            },
            child: Container(
              color: Colors.black87,
              padding: EdgeInsets.only(bottom: 0),
              child: ListView.builder(
                itemCount: list.length,
                padding: EdgeInsets.only(bottom: 80),
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    child: Text(
                      list[index],
                      style: TextStyle(
                        fontFamily: 'oswinFont',
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.all(10),
                  );
                },
              ),
            ),
          )),
    );
  }
}
