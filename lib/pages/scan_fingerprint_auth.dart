import 'package:evote/pages/home.dart';
import 'package:evote/pages/sign_up.dart';
import 'package:evote/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:evote/main.dart';

class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final LocalAuthentication auth = LocalAuthentication();

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
                "Login",
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Fingerprint berhasil'),
                              duration: const Duration(seconds: 8),
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LandingPage()));
                          } on PlatformException catch (error) {
                            print(error);
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
