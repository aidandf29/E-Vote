import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:evote/components/candidate_desc_dummy.dart';

class CandidateInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Item> items = Item.generatedItem;
    return Scaffold(
      backgroundColor: Color(0xFF05304B),
      body: Container(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Container(
              width: 360,
              height: 80,
              child: Text("Pemilihan Ketua Himpunan",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30))),
          Padding(padding: EdgeInsets.only(top: 25)),
          Center(
              child: Container(
            width: 360,
            height: 460,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items?.length,
              itemBuilder: (context, index) {
                if (index < items!.length) {
                  final item = items?[index];
                  return listItem(item!);
                } else {
                  return Text("X");
                }
              },
            ),
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

  Widget listItem(Item item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 320,
        height: 450,
        decoration: BoxDecoration(
            color: Colors.white30, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 27)),
            Container(
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  image: DecorationImage(
                      image: NetworkImage('${item.imgUrl}'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 60,
                child: Text('${item.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 26))),
            Container(
                height: 185,
                width: 330,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xFF0094B6),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  //MAX 300 CHARACTER
                  '${item.desc}',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )),
          ],
        ),
      ),
    );
  }
}
