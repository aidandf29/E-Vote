import 'package:evote/components/candidate_card.dart';
import 'dart:js';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../components/candidate_dummy.dart';

class CandidateChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Item> items = Item.generatedItem;
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
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        final item = items[index];
                        return listItem(item);
                      } else {
                        return Text("X");
                      }
                    },
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

  Widget listItem(Item item) {
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
                '${item.nomorUrutan}',
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
                      image: NetworkImage('${item.imgUrl}'),
                      fit: BoxFit.contain)),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              child: Text(
                item.name.length < 30
                    ? item.name
                    : "${item.name.substring(0, 28)}..",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
