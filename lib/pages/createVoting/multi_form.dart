import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:evote/pages/createVoting/empty_state.dart';
import 'package:evote/pages/createVoting/form.dart';
import 'package:evote/pages/createVoting/user.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Autogenerated {
  Data? data;

  Autogenerated({this.data});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? nama;
  String? deskripsi;
  int? jumlahVote;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  Attributes(
      {this.nama,
      this.deskripsi,
      this.jumlahVote,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    nama = json['Nama'];
    deskripsi = json['Deskripsi'];
    jumlahVote = json['Jumlah_vote'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['Deskripsi'] = this.deskripsi;
    data['Jumlah_vote'] = this.jumlahVote;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    return data;
  }
}

class MultiForm extends StatefulWidget {
  late final String started_date;
  late final String finished_date;
  late final String nama;
  late final List <String> list;
  MultiForm(
      {required this.started_date,
      required this.finished_date,
      required this.nama,
      required this.list});
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];
  List calon = [];
  List<int> lint = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06304b),
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
            onPressed: onSave,
          )
        ],
        backgroundColor: Color(0xff06304b),
      ),
      body: Container(
          child: users.length <= 0
              ? Center(
                  child: EmptyState(
                    title: 'Oops',
                    message: 'Add form by tapping add button below',
                  ),
                )
              : ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: users.length,
                  itemBuilder: (_, i) => users[i],
                )),
      // Column(
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Container(
      //         child: Text('Masukkan data diri calon',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontFamily: 'Poppins',
      //               fontSize: 20,
      //             )),
      //         padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      //       ),
      //       Container(
      //         decoration: BoxDecoration(
      //           // gradient: LinearGradient(
      //           //   colors: [
      //           //     Color(0xff06304b),
      //           //     Color(0xFFFFFFFF),
      //           //   ],
      //           //   begin: Alignment.topCenter,
      //           //   end: Alignment.bottomCenter,
      //           // )
      //           color: Color(0xff06304b),
      //         ),
      //         child: users.length <= 0
      //             ? Center(
      //                 child: EmptyState(
      //                   title: 'Oops',
      //                   message: 'Add form by tapping add button below',
      //                 ),
      //               )
      //             : ListView.builder(
      //                 addAutomaticKeepAlives: true,
      //                 itemCount: users.length,
      //                 itemBuilder: (_, i) => users[i],
      //               ),
      //       ),
      //     ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhereOrNull(
        (it) => it.user == _user,
        // orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = User();
      users.add(UserForm(
        user: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  Future<void> onSave() async {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        data.forEach((it) =>
            // response = http.post(
            //           Uri.parse("http://localhost:1337/api/voters"),
            //           headers: <String, String>{
            //             'Content-Type': 'application/json; charset=UTF-8',
            //           },
            //           body: jsonEncode(<Object, dynamic>{
            //             "data": {
            //               "Nama": it.fullName,
            //               "Deskripsi": it.description,
            //             }
            //           }),
            //         )
            // print(response.body)
            post(it.fullName, it.description));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     fullscreenDialog: true,
        //     builder: (_) => Scaffold(
        //       appBar: AppBar(
        //         title: Text('List of Users'),
        //       ),
        //       body: ListView.builder(
        //         itemCount: data.length,
        //         itemBuilder: (_, i) => ListTile(
        //           leading: CircleAvatar(
        //             child: Text(data[i].fullName.substring(0, 1)),
        //           ),
        //           title: Text(data[i].fullName),
        //         ),
        //       ),
        //     ),
        //   ),
        // );
      }
    }
  }

  post(nama, desc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt('id');
    print('nama ${nama}');
    print('print ${desc}');
    // var jsonResponse = null;
    var response = await http.post(
      Uri.parse("http://20.78.59.91/api/data-calons"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<Object, dynamic>{
        "data": {
          "Nama": nama,
          "Deskripsi": desc,
        }
      }),
    );
    final test = Autogenerated.fromJson(json.decode(response.body));
    // print(jsonResponse);
    // print (jsonResponse.map((job) => new Job.fromJson(job)).toList());
    print(test.data!.id);
    calon.add(test.data!.id);
    print(calon);
    lint = widget.list.map(int.parse).toList();
    final responsess = await http.post(
      Uri.parse("http://20.78.59.91/api/votings"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<Object, dynamic>{
        "data": {
          "started_date": widget.started_date,
          "finished_date": widget.finished_date,
          "Nama": widget.nama,
          "voters": lint,
          "calon": calon,
          "admin": intValue,
        }
      }),
    );
    var test1 = jsonDecode(responsess.body);
    print(test1);
    if (responsess.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Voting berhasil terbuat'),
        duration: const Duration(seconds: 8),
      ));
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Voting gagal terbuat'),
        duration: const Duration(seconds: 8),
      ));
    }

    // var test1 =test.fromJson(parsedJson);
    // print(jsonResponse.data?.attributes);
  }
}
