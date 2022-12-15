import 'dart:js';

import 'package:evote/components/vote_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:evote/pages/splash.dart';

import '../components/dummy.dart';
// import 'package:get/get.dart';

class Home extends StatelessWidget {
  List<Item> items = Item.generatedItem;
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      final item = items[index];
                      return listItem(item);
                    } else {
                      return Text("X");
                    }
                  },
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      final item = items[index];
                      return listItem(item);
                    } else {
                      return Text("X");
                    }
                  },
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

  Widget listItem1(Item item) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      height: 330,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [VoteCard(), VoteCard(), VoteCard()],
        ),
      ),
    );
  }

  Widget listItem(Item item) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: Color(0xFFE4E4E4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsetsDirectional.only(top: 20)),
              Container(
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${item.imgUrl}'),
                      fit: BoxFit.contain),
                ),
                child: Text(" "),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  item.name.length < 15
                      ? item.name
                      : "${item.name.substring(0, 12)}..",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 12,
                percent: item.persentase / 100,
                progressColor: Colors.green.shade300,
                backgroundColor: Colors.grey,
                barRadius: Radius.circular(5),
                center: Text(
                  '${item.persentase}%',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.red.shade200),
                  child: Center(
                    child: Text(item.waktu),
                  ))
            ],
          ),
        ));
  }
}
