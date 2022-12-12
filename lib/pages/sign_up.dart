import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:evote/model/login.dart';
import 'package:evote/pages/sign_in.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

// import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUp> {
  bool isHiddenPassword = true;
  String userId = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // List<Login> _destinations = <Login>[];
  @override
  void initState() {
    super.initState();
    // _populateDestinations();
  }

  signup(String name, email, pass) async {
    var jsonResponse = null;
    final getEmailUnique = await http.get(
      Uri.parse(
          "http://localhost:1337/api/voters?filters[email][\$eqi]=${email}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var emailResponse = (getEmailUnique.body);
    // var jsonValue = json.decode(jsonResponse['meta']);
    Map<Object, dynamic> user = jsonDecode(emailResponse);
    // Map<Object, dynamic> user1 = jsonEncode(user['data'][0]);
    print(user['data'].length);
    if (user['data'].length == 0) {
      final response = await http.post(
        Uri.parse("http://localhost:1337/api/voters"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<Object, dynamic>{
          "data": {
            "Name": name,
            "Email": email,
            "Password": pass,
          }
        }),
      );
      jsonResponse = (response.body);
      // var jsonValue = json.decode(jsonResponse['meta']);
      // Map<Object, dynamic> user = jsonDecode(jsonResponse);
      // Map<Object, dynamic> user1 = jsonEncode(user['data'][0]);
      print(jsonResponse);

      if (user['data'] == null) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Failed to Sign Up'),
            duration: const Duration(seconds: 1),
          ));
      } else {
        print("signup success");
        Navigator.pushReplacementNamed(context, '/');
      }
    }
    else{
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Email already registered'),
            duration: const Duration(seconds: 8),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF05304B),
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
              Padding(padding: EdgeInsets.only(bottom: 100)),
              //Text Container
              Container(
                  alignment: Alignment.center,
                  child: (RichText(
                    text: TextSpan(
                      text: 'Ahoy, Voters!',
                      style: TextStyle(
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600,
                          fontSize: 44,
                          color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: '\nSign up before boarding with us',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20)),
                      ],
                    ),
                  ))),
              Padding(padding: EdgeInsets.only(bottom: 120)),
              //Name Field
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: nameController,
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
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white60,
                        ))),
              ),
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
              Padding(padding: EdgeInsets.only(bottom: 170)),
              //Enter button
              Container(
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  height: 45,
                  onPressed: () => {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Empty Name, Email, or Password.')),
                        )
                      }
                    else if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(emailController.text))
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email not valid.')),
                        )
                      }
                    else if (passwordController.text.length < 8)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password is less than 8.')),
                        )
                      }
                    else
                      {
                        signup(nameController.text, emailController.text,
                            passwordController.text)
                      }
                  },
                  child: Image.asset('assets/image/submit.png', width: 45),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 60)),
              //Bottom text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nLogin',
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
                                          SignIn()))
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
