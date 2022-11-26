import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
      constraints: BoxConstraints(minHeight: 896),
      padding: EdgeInsets.only(top: 35),
      decoration: const BoxDecoration(color: Color(0xFF05304B)),
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
          height: 330,
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //Card 1
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
                //Card 2
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
                //Card 3
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
              ],
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
          height: 330,
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //Card 1
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
                //Card 2
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
                //Card 3
                Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
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
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/300x300"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 30,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: Colors.red.shade200),
                              child: Center(
                                child: Text("3 Hari Lagi"),
                              ))
                        ],
                      ),
                    )),
              ],
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
