import 'package:evote/components/vote_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:evote/pages/splash.dart';
// import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF05304B),
        body: Container(
            child: Container(
          padding: EdgeInsets.only(top: 35),
          child: Column(children: [
            //Voting Terdaftar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text('Voting Terdaftar',
                  style: TextStyle(
                    fontFamily: 'KulimPark',
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            //Voting Terdaftar ListViewnya
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              height: 285,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [VoteCard(), VoteCard(), VoteCard()],
                ),
              ),
            ),
            //Voting Buatan Anda
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text('Voting Buatan Anda',
                  style: TextStyle(
                    fontFamily: 'KulimPark',
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            //Voting Buatan Anda ListView
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              height: 285,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [VoteCard(), VoteCard(), VoteCard()],
                ),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color(0xFFFFCE40),
                elevation: 400,
                onPressed: () {
                  print('Pressed');
                })
          ]),
        )));
  }
}
