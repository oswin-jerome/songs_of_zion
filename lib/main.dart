import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import './Home.dart';
import './IndexNum.dart';
import 'AlphaIndex.dart';
import './SettingsScreen.dart';
import './AboutPage.dart';
void main(){
  runApp(MyApp());
  Admob.initialize("ca-app-pub-5374987389919062~6129179210");
  
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context)=> Home(),
        '/numIndex' :(context)=> IndexNum(),
        '/alphaIndex' :(context)=> AlphaIndex(),
        '/settings' :(context)=> SettingsScreen(),
        '/about' :(context)=> AboutPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Color(0xffff5e62),
        accentColor: Color(0xffff5e62),
        cardColor: Colors.orangeAccent,
      ),
    );
  }
}