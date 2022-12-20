import 'package:evote/pages/home.dart';
import 'package:evote/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FingerprintAuthVoting extends StatefulWidget {
  final int jumlah;
  final int? intValue;
  final int choose;
  final int? pilih;
  FingerprintAuthVoting(
      {required this.jumlah,
      required this.intValue,
      required this.choose,
      required this.pilih});

  @override
  _FingerprintAuthVotingState createState() => _FingerprintAuthVotingState();
}

class _FingerprintAuthVotingState extends State<FingerprintAuthVoting> {
  final LocalAuthentication auth = LocalAuthentication();
  var jsonResponse = null;
  var response_voteBody = null;

  Future post(BuildContext context) async {
    print('test3 ${widget.pilih}');

    final response = await http.put(
      Uri.parse("http://localhost:1337/api/data-calons/${widget.choose}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<Object, dynamic>{
        "data": {
          "Jumlah_vote": widget.jumlah + 1,
          "already_voters": widget.intValue
        }
      }),
    );
    final votings = await http.put(
      Uri.parse("http://localhost:1337/api/votings/${widget.pilih}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<Object, dynamic>{
        "data": {"already_voters": widget.intValue}
      }),
    );
    // jsonResponse = (response.body);
    // response_voteBody = (response_vote.body);
    Map<Object, dynamic> user = jsonDecode(jsonResponse);
    // var jsonValue = json.decode(jsonResponse['meta']);
    // Map<Object, dynamic> user = jsonDecode(jsonResponse);
    // Map<Object, dynamic> user1 = jsonEncode(user['data'][0]);
    // print('tes111${jsonResponse}');
    // print('tes111222${response_vote}');

    if (user['data'] == null) {
      print('gagal');
    } else {
      print("vote success");
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Fingerprint Auth")),
      backgroundColor: Color(0xFF3C3E52),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Voting",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/image/fingerprint.png",
                    width: 120.0,
                  ),
                  Text(
                    "Fingerprint Auth",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Authenticate using your fingerprint insted of your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final bool canAuthenticateWithBiometrics =
                            await auth.canCheckBiometrics;
                        final bool canAuthenticate =
                            canAuthenticateWithBiometrics ||
                                await auth.isDeviceSupported();
                        print({'cek support', canAuthenticate});
                        final List<BiometricType> availableBiometrics =
                            await auth.getAvailableBiometrics();
                        print({'cek available': availableBiometrics});
                        if (canAuthenticate) {
                          try {
                            final bool didAuthenticate = await auth.authenticate(
                                localizedReason:
                                    'Please authenticate to show account balance');
                            print({
                              'cek apakah fingerprint benar': didAuthenticate
                            });

                            post(context);
                            // final response = await http.put(
                            //   Uri.parse(
                            //       "http://localhost:1337/api/data-calons/${widget.choose}"),
                            //   headers: <String, String>{
                            //     'Content-Type':
                            //         'application/json; charset=UTF-8',
                            //   },
                            //   body: jsonEncode(<Object, dynamic>{
                            //     "data": {
                            //       "Jumlah_vote": widget.jumlah + 1,
                            //       "already_voters": widget.intValue
                            //     }
                            //   }),
                            // );
                            // final votings = await http.put(
                            //   Uri.parse(
                            //       "http://localhost:1337/api/votings/${widget.pilih}"),
                            //   headers: <String, String>{
                            //     'Content-Type':
                            //         'application/json; charset=UTF-8',
                            //   },
                            //   body: jsonEncode(<Object, dynamic>{
                            //     "data": {"already_voters": widget.intValue}
                            //   }),
                            // );
                            // switch (response.statusCode & votings.statusCode) {
                            //   case 200:
                            //     final data = json.decode(response.body);
                            //     return data;
                            //   default:
                            //     throw Exception(response.reasonPhrase);
                            // }
                          } on PlatformException catch (error) {
                            // print(error);
                            // post(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  const Text('Fingerprint gagal, coba kembali'),
                              duration: const Duration(seconds: 8),
                            ));
                          }
                        }
                      },
                      // style: ,
                      // elevation: 0.0,
                      // color: Color(0xFF04A5ED),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(30.0),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 14.0),
                        child: Text(
                          "Authenticate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
