import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:evote/model/login.dart';
import 'package:evote/pages/sign_up.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

// import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignIn> {
  bool isHiddenPassword = true;
  String userId = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // List<Login> _destinations = <Login>[];
  @override
  void initState() {
    super.initState();
    // _populateDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF0094B6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 25.0, 15.0, 0.0),
                    alignment: Alignment.topRight,
                    child:
                        Image.asset('assets/image/logo_real.png', width: 70.0),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 210)),
              //text container
              Container(
                  alignment: Alignment.center,
                  child: (RichText(
                    text: TextSpan(
                      text: 'E-Vote',
                      style: TextStyle(
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600,
                          fontSize: 46,
                          color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: '\nLogin for better future',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20)),
                      ],
                    ),
                  ))),
              Padding(padding: EdgeInsets.only(bottom: 100)),
              //email field
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        )),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white60,
                        ))),
              ),
              //password field
              SizedBox(
                  width: 300,
                  child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        )),
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: (isHiddenPassword == true)
                                ? Icon(Icons.visibility, color: Colors.white)
                                : Icon(Icons.visibility_off,
                                    color: Colors.white)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white60,
                        ),
                      ))),
              Padding(padding: EdgeInsets.only(bottom: 70)),
              //button submit
              Container(
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  height: 45,
                  onPressed: () => {
                    // _populateDestinations()
                  },
                  child: Image.asset('assets/image/submit.png', width: 45),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 120)),
              //Bottom text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don' 't have an account?',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nSign Up',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUp()))
                            },
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 31.5)),
            ],
          ),
        )),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}



// void _populateDestinations() async {
//   try {
//     final destinations = await _fetchAllDestinations();
//     setState(() {
//       _destinations = destinations;
//       print(_destinations);
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Main(
//                     id: _destinations[0].id,
//                     indexPage: 0,
//                   )));
//     });
//   } catch (Exception) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: const Text('Failed to Sign In'),
//       duration: const Duration(seconds: 1),
//     ));
//   }
// }
