import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';


Color scaffoldColor = Colors.amber;
Color bodyColor = Colors.white;

bool speechRecognition = false;
bool startWithScan = true;
bool darkModeState = false;
String data = "";
String phone = "254797580177";
String scannedCode = "";
final tillName = TextEditingController();
final tillAmount = TextEditingController();
final paybillNumber = TextEditingController();
final paybillAmount = TextEditingController();
final paybillAccount = TextEditingController();
final personNumber = TextEditingController();
final personAmount = TextEditingController();

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

