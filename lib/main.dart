import 'homePage.dart';
import 'package:flutter/material.dart';
import 'welcomePage.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';


void main() {
  MpesaFlutterPlugin.setConsumerKey("1OQhLGvOgAbNQeQG7DUukTn8PQEygvC3");
  MpesaFlutterPlugin.setConsumerSecret("qW73bBAl8W817NE8");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyPay',
      home: homeScreen(),
    );
  }
}