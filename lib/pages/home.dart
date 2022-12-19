// import 'dart:js';
import 'package:evote/components/vote_card.dart';
import 'package:evote/pages/createVoting/create_voting1.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:evote/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:evote/pages/letsVote/desc_candidate.dart';

import '../components/dummy.dart';

// import 'package:get/get.dart';
class Autogenerated {
  List<Data>? data;
  Meta? meta;

  Autogenerated({this.data, this.meta});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  int? phone;
  String? email;
  String? fingerprint;
  String? birth;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? address;
  Votings? votings;
  Votings? createdVotings;

  Attributes(
      {this.name,
      this.phone,
      this.email,
      this.fingerprint,
      this.birth,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.address,
      this.votings,
      this.createdVotings});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    phone = json['Phone'];
    email = json['Email'];
    fingerprint = json['Fingerprint'];
    birth = json['Birth'];
    password = json['Password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    address = json['Address'];
    votings =
        json['votings'] != null ? new Votings.fromJson(json['votings']) : null;
    createdVotings = json['created_Votings'] != null
        ? new Votings.fromJson(json['created_Votings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['Fingerprint'] = this.fingerprint;
    data['Birth'] = this.birth;
    data['Password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    data['Address'] = this.address;
    if (this.votings != null) {
      data['votings'] = this.votings!.toJson();
    }
    if (this.createdVotings != null) {
      data['created_Votings'] = this.createdVotings!.toJson();
    }
    return data;
  }
}

class Votings {
  List<dataVotings>? data;

  Votings({this.data});

  Votings.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <dataVotings>[];
      json['data'].forEach((v) {
        data!.add(new dataVotings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class dataVotings {
  int? id;
  AttributesVoting? attributes;

  dataVotings({this.id, this.attributes});

  dataVotings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new AttributesVoting.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class AttributesVoting {
  String? startedDate;
  String? finishedDate;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? nama;

  AttributesVoting(
      {this.startedDate,
      this.finishedDate,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.nama});

  AttributesVoting.fromJson(Map<String, dynamic> json) {
    startedDate = json['started_date'];
    finishedDate = json['finished_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    nama = json['Nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['started_date'] = this.startedDate;
    data['finished_date'] = this.finishedDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    data['Nama'] = this.nama;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({this.page, this.pageSize, this.pageCount, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['pageCount'] = this.pageCount;
    data['total'] = this.total;
    return data;
  }
}

class Home extends StatefulWidget {
  late final String id;
  Home();
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<dataVotings>? items = <dataVotings>[];
  late List<dataVotings>? itemCreatedVotings = <dataVotings>[];
  final date2 = DateTime.now();

  @override
  Future get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt('id');
    String? stringValue = prefs.getString('email');
    var jsonResponse = null;
    final response = await http.get(
      Uri.parse(
          "http://20.78.59.91/api/voters?filters[email][\$eqi]=${stringValue}&&populate=%2A"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    jsonResponse = (response.body);
    final test = Autogenerated.fromJson(json.decode(response.body));

    // var jsonValue = json.decode(jsonResponse['meta']);
    Map<Object, dynamic> user = jsonDecode(jsonResponse);
    // Map<Object, dynamic> user1 = jsonEncode(user['data'][0]);
    // print(user1['name']);

    if (user['data'].length == 0) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: const Text('Failed to Sign In'),
      //   duration: const Duration(seconds: 1),
      // ));
      print("login not success");
    } else {
      // items = (test.data?[0].attributes?.votings?.data != null) as List<AttributesVoting>;
      print("login success");
      print(test.data?[0].attributes?.createdVotings?.data);
      items = test.data?[0].attributes?.votings?.data;
      itemCreatedVotings = test.data?[0].attributes?.createdVotings?.data;
    }
    // print(intValue);
    // print(jsonResponse.data[0].nama);
    // Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
    // _populateDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: get(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Scaffold(
                    backgroundColor: Color(0xFF05304B),
                    body: SingleChildScrollView(
                        child: Stack(children: <Widget>[
                      Container(
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
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          //Voting Terdaftar ListViewnya
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            // height: 285,
                            height: 325,
                            child: Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items?.length,
                                itemBuilder: (context, index) {
                                  if (index < items!.length) {
                                    final item = items?[index];
                                    return listItem(context, item!);
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
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          //Voting Buatan Anda ListView
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            // height: 285,
                            height: 325,
                            child: Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemCreatedVotings!.length,
                                itemBuilder: (context, index) {
                                  if (index < itemCreatedVotings!.length) {
                                    final item = itemCreatedVotings![index];
                                    return listItem(context, item);
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CreateVoting1()));
                              })
                        ]),
                      ))
                    ])));

                // return Text('test');
              }
            }));
  }

  // Widget listItem1(AttributesVoting item) {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
  //     height: 330,
  //     child: Expanded(
  //       child: ListView(
  //         scrollDirection: Axis.horizontal,
  //         children: [VoteCard(), VoteCard(), VoteCard()],
  //       ),
  //     ),
  //   );
  // }

  Widget listItem(context, dataVotings item) {
    return GestureDetector(
        onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    CandidateInfo(choose: item.id))),
        child: Container(
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
                          image: NetworkImage('assets/image/logo_real.png'),
                          fit: BoxFit.contain),
                    ),
                    child: Text(" "),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      item.attributes!.nama!.length < 15
                          ? item.attributes!.nama!
                          : "${item.attributes!.nama!.substring(0, 12)}..",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  LinearPercentIndicator(
                    lineHeight: 12,
                    // percent: item.persentase / 100,
                    percent: 0.75,
                    progressColor: Colors.green.shade300,
                    backgroundColor: Colors.grey,
                    barRadius: Radius.circular(5),
                    center: Text(
                      // '${item.persentase}%',
                      '75',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.red.shade200),
                      child: Center(
                        // child: Text(item.waktu),
                        child: Text(
                            '${((date2.difference(DateTime.parse(item.attributes!.finishedDate!)).inDays) > 0 ? '0' : (date2.difference(DateTime.parse(item.attributes!.finishedDate!)).inDays) * -1).toString()} hari'),
                      ))
                ],
              ),
            )));
  }
}
