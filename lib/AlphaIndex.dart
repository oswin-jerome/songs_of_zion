import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Drawer.dart';
import 'package:flutter/services.dart' show rootBundle;
import './Display.dart';

class AlphaIndex extends StatefulWidget {
  @override
  _AlphaIndexState createState() => _AlphaIndexState();
}

class _AlphaIndexState extends State<AlphaIndex> {
  var list = {};
  var letters = [
    "m",
    "M",
    ",",
    "c",
    "C",
    "v",
    "V",
    "I",
    "X",
    "f",
    "fh",
    "fp",
    "fP",
    "F",
    "\$",
    "nf",
    "Nf",
    "nfh",
    "Nfh",
    "if",
    "f;",
    "r",
    "rp",
    "rP",
    "R",
    "#",
    "Nr",
    "nrh",
    "j",
    "jh",
    "jp",
    "jP",
    "J",
    "J}",
    "nj",
    "Nj",
    "njh",
    "Njh",
    "e",
    "eh",
    "ep",
    "eP",
    "ne",
    "Ne",
    "neh",
    "g",
    "g;",
    "gh",
    "gp",
    "G",
    "G+",
    "Ng",
    "ngh",
    "Nghw;",
    "k",
    "kh",
    "kP",
    "K",
    "nk",
    "Nk",
    "Nkh",
    "ah",
    "A",
    "Nah",
    "u",
    "uh",
    "y",
    "Nyh",
    "t",
    "th",
    "tp",
    "tP",
    "nt",
    "Nt",
    "it",
    "[",
    "[P",
    "n[",
    "];"
  ];
  @override
  void initState() {
    super.initState();
    loadList();
  }

  loadList() async {
    var raw = await rootBundle.loadString('assets/a_indices.json');
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
          title: Text("Alpha list"),
          centerTitle: true,
        ),
        drawer: DrawerCustom("Aplha"),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffff9966),
              Color(0xffff5e62),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: letters.length,
              itemBuilder: (BuildContext c, int i) {
                return Card(
                    child: Container(
                  child: Osw(letters[i], list[letters[i]]),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Osw extends StatefulWidget {
  var l;
  var sl;
  Osw(this.l, this.sl);
  @override
  _OswState createState() => _OswState();
}

class _OswState extends State<Osw> {
  var show = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          show = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffff7c3d),
          Color(0xffffa64c),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  show = !show;
                });
              },
              child: Text(
                widget.l,
                style: TextStyle(
                    fontFamily: 'oswinFont',
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            show
                ? Container(
                    child: InternalList(widget.l),
                    height: 300,
                    margin: EdgeInsets.only(top: 20),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class InternalList extends StatefulWidget {
  var ke;
  InternalList(this.ke);
  @override
  _InternalListState createState() => _InternalListState();
}

class _InternalListState extends State<InternalList> {
  var list = [];
  @override
  void initState() {
    super.initState();
    loadList();
  }

  loadList() async {
    var raw = await rootBundle.loadString('assets/a_indices.json');
    var songs = json.decode(raw);
    setState(() {
      list = songs[widget.ke];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext c, int i) {
        return GestureDetector(
          onTap: () {
            var s = list[i];
            print(s.split('.')[0]);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Display(int.parse(s.split('.')[0]))));
          },
          child: Card(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                list[i],
                style: TextStyle(fontFamily: 'oswinFont', fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
