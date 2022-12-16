import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ScanFingerprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF05304B),
        body: Container(
          child: Column(children: [
            Container(
              child: Text("Pindai"),
            ),
            Container(
              child: Text("sidik jarimu"),
            ),
            Container(
                child:
                    Image.asset('../../../assets/image/fingerprint_white.png'))
          ]),
        ));
  }
}
