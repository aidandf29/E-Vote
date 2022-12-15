import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './dummy.dart';

class VoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage("https://picsum.photos/300/300"),
                      fit: BoxFit.contain),
                ),
                child: Text(" "),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Nama Votingnya",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 12,
                percent: 0.75,
                progressColor: Colors.green.shade300,
                backgroundColor: Colors.grey,
                barRadius: Radius.circular(5),
                center: Text(
                  "75%",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.red.shade200),
                  child: Center(
                    child: Text("3 Hari Lagi"),
                  ))
            ],
          ),
        ));
  }
}
