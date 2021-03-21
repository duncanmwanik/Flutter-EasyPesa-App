import 'personPage.dart';
import 'tillPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settingsPage.dart';
import 'package:barras/barras.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'globals.dart';
import 'paybillPage.dart';


class homeScreen extends StatefulWidget {

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  clearText(){
    tillName.clear();
    paybillNumber.clear();
    tillAmount.clear();
    paybillAmount.clear();
    paybillAccount.clear();
    personNumber.clear();
    personAmount.clear();
  }

  scan() async{
    data = "";
    data = await Barras.scan(
      context,
      viewfinderHeight: 300,
      viewfinderWidth: 300,
      scrimColor: Colors.amber.withOpacity(0.3),
      borderColor: Colors.red,
      borderRadius: 24,
      borderStrokeWidth: 5,
      buttonColor: Colors.yellow,
      borderFlashDuration: 300,
      cancelButtonText: "Cancel",
      successBeep: false,
    );

    setState(() {
      scannedCode = data ?? "";
    });

    if(scannedCode.startsWith('Pay')){
      var arr = scannedCode.split('|');
      String p = arr[0];
      String n = arr[1];
      setState(() {
        paybillNumber.text = p.split(':')[1];
        paybillAccount.text = n.split(':')[1];
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => paybillScreen()),);
    }
    if(scannedCode.startsWith('Till')){
      var arr = scannedCode.split(':');
      setState(() {
        tillName.text = arr[1];
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => tillScreen()),);
    }
    if(scannedCode.startsWith('Person')){
      var arr = scannedCode.split(':');
      setState(() {
        personNumber.text = arr[1];
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => personScreen()),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Easy',
            style: TextStyle(fontFamily: "UB",fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: IconButton(icon: Icon(Icons.settings_rounded, size: 30),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()),);
                } ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.qr_code_outlined, size: 150,),
                          onTap: () async {
                            try{
                              scan();
                            }
                            catch(e){
                              data="";
                              clearText();
                            }
                          },
                        ),
                        Text('Tap to Scan',
                          style: TextStyle(
                              fontFamily: "UB",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),)
                      ],
                    ),
                  ),
                  SizedBox(height: 200,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        child: Container(
                          height: 75,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Colors.black38,
                                    blurRadius: 20)
                              ]),
                          child: MaterialButton(
                            splashColor: Colors.white,
                            focusColor: Colors.white,
                            child: Text(
                              'Paybill',
                              style: TextStyle(
                                fontFamily: "UB",
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => paybillScreen()),);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        child: Container(
                          height: 75,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Colors.black38,
                                    blurRadius: 20)
                              ]),
                          child: MaterialButton(
                            splashColor: Colors.white,
                            focusColor: Colors.white,
                            child: Text(
                              'Till',
                              style: TextStyle(
                                fontFamily: "UB",
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => tillScreen()),);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        child: Container(
                          height: 75,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Colors.black38,
                                    blurRadius: 20)
                              ]),
                          child: MaterialButton(
                            splashColor: Colors.white,
                            focusColor: Colors.white,
                            child: Text(
                              'Person',
                              style: TextStyle(
                                fontFamily: "UB",
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => personScreen()),);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
            )
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          scan();
        },
        label: Icon(Icons.qr_code_scanner, color: Colors.black,),
        backgroundColor: Colors.amber
    );
  }

}
