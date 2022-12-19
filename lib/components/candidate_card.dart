// import 'dart:html';
import 'package:flutter/material.dart';

class CandidateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          print("nice");
        },
        child: (Container(
          padding: EdgeInsets.all(15),
          height: 220,
          width: 270,
          decoration: BoxDecoration(
            color: Color(0xFF05304B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Nomor Urut 1",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/300/300"),
                      fit: BoxFit.contain)),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              child: Text(
                "Prabowo Sugianto",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
