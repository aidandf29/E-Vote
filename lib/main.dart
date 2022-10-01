import 'package:evote/pages/home.dart';
import 'package:evote/pages/pin_auth_page.dart';
import 'package:evote/pages/scan_fingerprint_auth.dart';
import 'package:evote/pages/sign_in.dart';
import 'package:evote/pages/sign_up.dart';
import 'package:evote/pages/splash.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      routes: {
        "/": (context) => Home(),
        "/login": (context) => SignIn(),
        "/signup": (context) => SignUp(),
        "/scanf": (context) => ScanFinger(),
        "/pinauth": (context) => PinAuthPage(),
        "/splash": (context) => Splash(),
      },
    );
  }
}
