import 'package:adcolony/adcolony.dart';
import 'package:adcolony/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import './Display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './Drawer.dart';
import 'package:admob_flutter/admob_flutter.dart';
class Home extends StatelessWidget {
  TextEditingController _noC = TextEditingController();
  AdmobInterstitial interstitialAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    openSong(int songNumber) {
      print(songNumber);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Display(songNumber)));
    }


  AdColony.init(AdColonyOptions("app3da4bfb670ca4c4489", '0', [
    'vz1772caf266b34058a3',
    "vzefb74845c36d4bba80"
  ]));

  listener(AdColonyAdListener event) {
    print(event);
    if (event == AdColonyAdListener.onRequestFilled)
      AdColony.show();
  }

   interstitialAd = AdmobInterstitial(
      adUnitId: "ca-app-pub-5374987389919062/7841075501",
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        print('Interstitial');
      },
    );

  interstitialAd.load();

    return Hero(
      tag: "H1",
      child: Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          backgroundColor: Color(0xffff9966),
          elevation: 0,
        ),
        drawer: DrawerCustom("Home"),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffff9966),
              Color(0xffff5e62),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 23,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox.expand(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x33ffffff),
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 3)),
                          ),
                          width: 100,
                          child: TextFormField(
                            controller: _noC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          shape: CircleBorder(),
                          onPressed: () {
                            interstitialAd.show();
                            AdColony.request("vzefb74845c36d4bba80", listener);
                            if (_noC.text == "") {
                              print("Alert Enter a value");
                              Fluttertoast.showToast(
                                  msg: "Enter a song number",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              openSong(int.parse(_noC.text));
                            }
                          },
                          child: Container(
                              height: 60,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xffff9966),
                                ),
                              )),
                        ),
                      ],
                    )),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "App by Oswin Jerome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                BannerView((e)=>{
                  print("ad loaded")
                }, BannerSizes.banner,"vz1772caf266b34058a3"),
                AdmobBanner(adUnitId: "ca-app-pub-5374987389919062/1280370732", adSize: AdmobBannerSize.BANNER)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
