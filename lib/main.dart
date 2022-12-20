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

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // home: BotNavBar(),
//       routes: {
//         "/": (context) => SignIn(),
//         "/home": (context) => Home(),
//         "/signup": (context) => SignUp(),
//         // "/scanf": (context) => SignIn(),
//         "/pinauth": (context) => PinAuthPage(),
//         "/splash": (context) => Splash(),
//         "/create": (context) => CreateVoting1(),
//         "/manage": (context) => ManageVoting(),

//         // "/calon": (context) => MultiForm(),
//         "/profile": (context) => Profile(),
//         // "/choose": (context) => CandidateChoose(),
//         // "/candidate": (context) => CandidateInfo(),
//         "/chooseConfirm": (context) => ScanFingerprint(),
//       },
//     );
//   }
// }

void main() => runApp(new MaterialApp(
      initialRoute: '/sign_in',
      routes: {
        '/sign_up': (context) => SignUp(),
        '/sign_in': (context) => SignIn(),
      },
    ));

class Main extends StatefulWidget {
  late String id;
  late int indexPage;

  Main({required this.id, required this.indexPage});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  String userId = "";

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      widget.indexPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    userId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    List<Widget> pageList = <Widget>[
      Home(),
      Profile(),
      History(),
    ];

    return Scaffold(
      body: pageList[widget.indexPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 100,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF05304B),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(
              Icons.history,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
        onTap: onTap,
      ),
    );
  }
}
