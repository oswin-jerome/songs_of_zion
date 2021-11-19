import 'package:flutter/material.dart';
import './Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9966),
        elevation: 0,
      ),
      drawer: DrawerCustom("About"),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffff9966),
            Color(0xffff5e62),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "App version",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1.0.1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Developed by",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Oswin Jerome",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    launchURL() async {
                      const url = 'https://oswin1998.cf';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    launchURL();
                  },
                  child: Container(
                    color: Colors.white,
                    height: 50,
                    child: Center(
                        child: Text(
                      "oswinjerome.in",
                      style: TextStyle(
                          color: Color(0xffff5e62),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
