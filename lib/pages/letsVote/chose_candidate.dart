import 'package:evote/components/candidate_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CandidateChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0094B6),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                  height: 80,
                  width: 360,
                  child: Text("Tentukan Pilihanmu",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30))),
              Container(
                  height: 480,
                  width: 300,
                  alignment: Alignment.center,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      CandidateCard(),
                      CandidateCard(),
                      CandidateCard()
                    ],
                  )),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: MaterialButton(
                        padding: EdgeInsets.only(left: 70),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 150),
                      child: MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFFCE3F)),
                          child: Text(
                            "Lanjut",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
