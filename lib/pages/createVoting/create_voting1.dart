import 'package:evote/pages/createVoting/multi_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:evote/pages/createVoting/create_voting2.dart';
import 'package:evote/pages/createVoting/multi_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const CreateVoting1());

class CreateVoting1 extends StatelessWidget {
  const CreateVoting1({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Create Voting 1';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Color.fromARGB(1000, 6, 48, 75),
        // appBar: AppBar(
        //   leading: const Icon(Icons.chevron_left),
        //   backgroundColor: Color.fromARGB(1000, 6, 48, 75),
        //   foregroundColor: Colors.white,
        // ),
        body: const SingleChildScrollView(
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  late SharedPreferences sharedPreferences;
  String _selectedDate = 'Tap to select date';
  String _date = '';
  String now = '';
  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController votersController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2070),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
        _date = new DateFormat('yyyy-MM-dd').format(d);
        now = new DateFormat('yyyy-MM-dd').format(DateTime.now());
      });
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  Dio dio = Dio(BaseOptions(
    contentType: "application/json",
  ));
  late File _image;

  Future getImage() async {
    String responseString = '';
    final picker = ImagePicker();
    var image = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    ); // <- Reduce Image quality);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        print(_image);
        // upload(_image);
      } else {
        print('No image selected.');
      }
    });

    // final file = File(image.path);
    // print(file);
    // print(file.path);
    // Set URI
    // final uri = Uri.parse(
    //     'https://');
    // Set the name of file parameter
    final parameter = 'photo';

    // Upload
    // final request = http.MultipartRequest('PUT', uri)
    //   ..files.add(await http.MultipartFile.fromPath('photo', file.path,
    //       contentType: new MediaType('image', 'jpeg')));
    // final response = await request.send();
    // if (response.statusCode == 200) {
    //   responseString = String.fromCharCodes(await response.stream.toBytes());
    // }
    // print(responseString);
  }

  create(nama, started_date, finished_date, voters) async {
    var jsonResponse = null;
    List<String> list = voters.split(',');
    print(nama);
    // final response = await http.post(
    //   Uri.parse("http://localhost:1337/api/votings"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<Object, dynamic>{
    //     "data": {
    //       "started_date": started_date,
    //       "finished_date": finished_date,
    //       "Nama": nama,
    //       "voters": list
         
    //     }
    //   }),
    // );
    // jsonResponse = (response.body);
    // var jsonValue = json.decode(jsonResponse['meta']);
    // Map<Object, dynamic> user = jsonDecode(jsonResponse);
    // print("[${voters}]");
    // Map<Object, dynamic> user1 = jsonEncode(user['data'][0]);
    // print(user1['name']);

    // if (user['data'].length == 0) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text('Failed to Sign In'),
    //     duration: const Duration(seconds: 1),
    //   ));
    // } else {
      print("create voting success");
      // print(jsonResponse.data[0].nama);
     Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MultiForm(started_date: started_date, finished_date: finished_date, nama: nama, list: list)));
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: EdgeInsets.all(26),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Text('Atur voting mu',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        color: Colors.white)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text('1 of 3',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Colors.white)),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color.fromARGB(1000, 255, 206, 64),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    )
                  ],
                )),
            Container(
              child: Text('Nama Voting',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('Jumlah Calon',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: jumlahController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (val) {
                if (val == null || val == "") {
                  return 'Please enter the number of candidates';
                }
                if (int.tryParse(val) == null) {
                  return 'Only enter numbers in the phone number field';
                }
                return null;
              },
            ),
            Container(
              child: Text('Tanggal berakhir',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     fillColor: Colors.white,
            //     contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //     filled: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  // child: Container(
                  // decoration: BoxDecoration(color: Colors.white),
                  child: Text(_selectedDate,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white)),
                  // ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  tooltip: 'Tap to open date picker',
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ],
            ),
            Container(
              child: Text('Thumbnail',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            Container(
                child: GestureDetector(
              onTap: () {
                getImage();
              },
              child: Center(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/upload.jpg',
                    width: 300,
                    height: 200,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            )),
            Container(
              child: Text('Silahkan Masukkan ID Voters',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //     fillColor: Colors.white,
            //     filled: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 15, 130, 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    Text(
                      "Setiap ID dibatasi dengan koma (,). Contoh 1,2,3,4.\n\ Pastikan Format benar, sistem akan \n\ mendeteksi terkait siapa saja \n\ yang bisa akses voting ini",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Colors.white),
                    )
                  ]),
            ),
            // Container(
            //     padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
            //     child: GestureDetector(
            //       onTap: () {
            //         getImage();
            //       },
            //       child: Center(
            //         child: ClipRRect(
            //           child: Image.asset(
            //             'assets/image/upload.jpg',
            //             width: 300,
            //             height: 200,
            //           ),
            //           borderRadius: BorderRadius.circular(50.0),
            //         ),
            //       ),
            //     )),
            TextFormField(
              controller: votersController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 50),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              // validator: (val) {
              //   if (val == null || val == "") {
              //     return 'Please enter the number of candidates';
              //   }
              //   if (int.tryParse(val) == null) {
              //     return 'Only enter numbers in the phone number field';
              //   }
              //   return null;
              // },
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(300, 30, 0, 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => MultiForm()),
                            // );
                            create(namaController.text, now, _date, votersController.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          primary: Color.fromARGB(1000, 255, 206, 64),
                          onPrimary: Colors.white,
                        ),
                        child: Text(
                          'Lanjutkan',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
