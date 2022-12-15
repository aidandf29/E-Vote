import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:evote/components/vote_card.dart';
// import 'package:get/get.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF05304B),
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 35)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text('Riwayat Voting',
                    style: TextStyle(
                      fontFamily: 'KulimPark',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                child: Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Colors.black.withOpacity(0.23))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                decoration: InputDecoration(
                                  hintText: "Cari riwayat voting anda",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 15,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () => {},
                                icon: Icon(Icons.search, color: Colors.white)),
                          ],
                        ))),
              ),
              Container(
                  child: Expanded(
                child: GridView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.76,
                  ),
                  children: [
                    VoteCard(),
                    VoteCard(),
                    VoteCard(),
                    VoteCard(),
                    VoteCard(),
                    VoteCard(),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
