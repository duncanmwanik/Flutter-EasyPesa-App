import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '';
import 'globals.dart';


class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key, this.title}) : super(key: key);
  final String title;

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String tillName;
  String paybillName;
  String tillAmount;
  String paybillAmount;
  String paybillAccount;
  String personNumber;
  String personAmount;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black, size: 40,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: bodyColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [

              SizedBox(height: (h-h/2)/3.5),

              Padding(////////Darkmode Switch
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Colors.black38,
                            blurRadius: 20)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Darkmode',
                        style: TextStyle(
                          fontFamily: "UB",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CupertinoSwitch(
                        value: darkModeState,
                        activeColor: Colors.black,
                        onChanged: (value){
                          setState(() {
                            darkModeState = value;
                          });
                          // if(darkModeState==false){
                          //   setState(() {
                          //     bodyColor = Colors.white;
                          //     scaffoldColor = Colors.amber;
                          //   });
                          // }
                          // else{
                          //   setState(() {
                          //     bodyColor = Colors.black12;
                          //     scaffoldColor = Colors.white12;
                          //   });
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(////////Start-Screen Switch
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Colors.black38,
                            blurRadius: 20)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Start In QR Scanner',
                        style: TextStyle(
                          fontFamily: "UB",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CupertinoSwitch(
                        value:startWithScan,
                        activeColor: Colors.black,
                        onChanged: (value){
                          setState(() {
                            startWithScan = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(////////Speech-Rec Switch
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Colors.black38,
                            blurRadius: 20)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Speech Recognition',
                        style: TextStyle(
                          fontFamily: "UB",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CupertinoSwitch(
                        value: speechRecognition,
                        activeColor: Colors.black,
                        onChanged: (value){
                          setState(() {
                            speechRecognition = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

