import 'package:evote/pages/history.dart';
import 'package:evote/pages/home.dart';
import 'package:evote/pages/letsVote/choose_feedback.dart';
import 'package:evote/pages/letsVote/chose_candidate.dart';
import 'package:evote/pages/letsVote/desc_candidate.dart';
import 'package:evote/pages/pin_auth_page.dart';
import 'package:evote/pages/profil.dart';
import 'package:evote/pages/scan_fingerprint_auth.dart';
import 'package:evote/pages/sign_in.dart';
import 'package:evote/pages/sign_up.dart';
import 'package:evote/pages/createVoting/create_voting1.dart';
import 'package:evote/pages/createVoting/create_voting2.dart';
import 'package:evote/pages/createVoting/create_voting3.dart';
import 'package:evote/pages/createVoting/multi_form.dart';
import 'package:evote/pages/manage_vote.dart';
import 'package:evote/pages/splash.dart';
import 'package:evote/pages/scan_fingerprint_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:evote/components/navBar.dart';

// import 'package:get/get.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BotNavBar(),
      // routes: {
      //   "/": (context) => CandidateInfo(),
      //   "/login": (context) => Home(),
      //   "/signup": (context) => SignUp(),
      //   // "/scanf": (context) => SignIn(),
      //   "/pinauth": (context) => PinAuthPage(),
      //   "/splash": (context) => Splash(),
      //   "/create": (context) => CreateVoting1(),
      //   "/manage": (context) => ManageVoting(),

      //   // "/calon": (context) => MultiForm(),
      //   "/profile": (context) => Profile(),
      //   "/choose": (context) => CandidateChoose(),
      //   "/candidate": (context) => CandidateInfo(),
      //   "/chooseConfirm": (context) => ScanFingerprint(),
      // },
    );
  }
}
