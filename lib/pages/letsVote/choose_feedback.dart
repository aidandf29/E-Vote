import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CandidateChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0094B6),
      body: Container(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 100)),
          Container(
              height: 80,
              child: Text("Tentukan Pilihanmu",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 35))),
          Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: MaterialButton(
                  child: Icon(Icons.arrow_left_rounded,
                      size: 80, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/300/300"),
                      fit: BoxFit.contain),
                ),
              ),
              Container(
                child: MaterialButton(
                  child: Icon(Icons.arrow_right_rounded,
                      size: 80, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
          Container(
              alignment: Alignment.center,
              height: 70,
              child: Text("Prabowo Subianto",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28))),
          Container(
              height: 250,
              width: 330,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Color(0xFF0094B6),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: MaterialButton(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFCE3F)),
                child: Text(
                  "Pilih Sekarang",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}
