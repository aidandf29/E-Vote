import 'dart:html';

import 'package:evote/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class ScanFingerprint extends StatefulWidget {
  const ScanFingerprint({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<ScanFingerprint> {
  Future<void> promptFingerprintScan() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    print({'cek support', canAuthenticate});
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print({'cek available': availableBiometrics});
    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Pindai sidik jari anda untuk menyimpan pilihan');
        print({'cek apakah fingerprint benar': didAuthenticate});
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      } on PlatformException catch (error) {
        print(error);
      }
    }
  }

  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    // promptFingerprintScan();
    return Scaffold(
        backgroundColor: Color.fromRGBO(5, 48, 75, 1),
        body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 130)),
            Container(
              padding: EdgeInsets.only(left: 50),
              alignment: Alignment.centerLeft,
              child: Text(
                "Pindai",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              padding: EdgeInsets.only(left: 50),
              alignment: Alignment.centerLeft,
              child: Text(
                "sidik jarimu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Container(
                padding: EdgeInsets.all(25),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0094B6)),
                child:
                    Image.asset('../../../assets/image/fingerprint_white.png')),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 15.0),
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: 24.0, vertical: 14.0),
            //       child: Text(
            //         "Authenticate",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ));
  }
}
