import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barras/barras.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'globals.dart';



class paybillScreen extends StatefulWidget {

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  _paybillScreenState createState() => _paybillScreenState();
}

class _paybillScreenState extends State<paybillScreen> {

  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: paybillNumber.text,
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: double.parse(paybillAmount.text),
          partyA: phone,
          partyB: paybillNumber.text,
          //Lipa na Mpesa Online ShortCode

          //http://mpesa-requestbin.herokuapp.com/sdp212sd
          callBackURL: Uri(
              scheme: "https",
              host: "mpesa-requestbin.herokuapp.com",
              path: "/sdp212sd"),
          //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
          accountReference: paybillAccount.text,
          phoneNumber: phone,
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "purchase",
          passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      //This passkey has been generated from Test Credentials from Safaricom Portal

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

  clearText(){
    paybillNumber.clear();
    paybillAmount.clear();
    paybillAccount.clear();
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
    }
    if(scannedCode.startsWith('Till')){
      var arr = scannedCode.split(':');
      setState(() {

      });
    }
    if(scannedCode.startsWith('Person')){
      var arr = scannedCode.split(':');
      setState(() {
        personNumber.text = arr[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: Appbar(),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: (h-h/2)/3.5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: h/1.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(10, 10),
                              color: Colors.black38,
                              blurRadius: 20)
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(////////Title of Payment Action
                              padding: const EdgeInsets.only(top: 20, left: 40, right: 20, bottom: 10),
                              child: Container(
                                height: 40,
                                width: 95,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(10, 10),
                                          color: Colors.black38,
                                          blurRadius: 20)
                                    ]),
                                child: Center(child: Text('Paybill',
                                  style: TextStyle(
                                      fontFamily: "UB",
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ],
                        ),

                        Padding(//////////Text Input for Paybill Number
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20, bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20)
                                ]),
                            child: TextField(
                              controller: paybillNumber,
                              cursorColor: Colors.black,
                              cursorWidth: 2,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Paybill Number',
                                hintStyle: TextStyle(
                                    fontFamily: "UB",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(//////////Text Input for Account Name
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20)
                                ]),
                            child: TextField(
                              controller: paybillAccount,
                              cursorColor: Colors.black,
                              cursorWidth: 2,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Account Name',
                                hintStyle: TextStyle(
                                    fontFamily: "UB",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(//////////Text Input for Amount
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20)
                                ]),
                            child: TextField(
                              controller: paybillAmount,
                              cursorColor: Colors.black,
                              cursorWidth: 2,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Amount',
                                hintStyle: TextStyle(
                                    fontFamily: "UB",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(////////////Pay Button
                          padding: const EdgeInsets.only(top: 20,),
                          child: Container(
                            height: h/13,
                            width: w/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20)
                                ]),
                            child: MaterialButton(
                              splashColor: Colors.amber,
                              focusColor: Colors.amber,
                              child: Text(
                                'Pay',
                                style: TextStyle(
                                  fontFamily: "UB",
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                FocusScopeNode currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                lipaNaMpesa();

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
          scan();
        },
        label: Icon(Icons.qr_code_scanner, color: Colors.black,),
        backgroundColor: Colors.amber);
  }
}

class Appbar extends StatelessWidget with PreferredSizeWidget{
  const Appbar({
    Key key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black, size: 40,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
