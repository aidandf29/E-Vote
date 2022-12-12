import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';

// void _pickImageCamera() async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.getImage(source: ImageSource.camera);
//   final pickedImageFile = File(pickedImage.path);
//   setState(({_pickedImage = pickedImageFile;}));
//   Navigator.pop(context);
// }

// void _pickImageGallery() async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.getImage(source: ImageSource.gallery);
//   final pickedImageFile = File(pickedImage.path);
//   setState(({_pickedImage = pickedImageFile;}));
// }

// void setState(Set set) {
// }

// void _remove() {
//   setState(() {
//     _pickedImage = null;
//   }
//   )
// }

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF05304B),
        body: Container(
            child: Container(
                constraints: BoxConstraints(minHeight: 896),
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 60)),
                    Center(
                        child: Stack(children: [
                      //Border behind image <!! DO NOT MEDDLE !!>
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 180,
                          )),
                      //Display Picture <!! DO NOT MEDDLE WITH STYLING !!>
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 33, vertical: 13),
                          child: CircleAvatar(
                            radius: 167,
                            backgroundImage:
                                NetworkImage("https://picsum.photos/500/500"),
                          )),
                      //Button for Profile Picture
                      Positioned(
                        bottom: 5,
                        right: 30,
                        child: RawMaterialButton(
                          elevation: 0,
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Color(0xFFE4E4E4),
                          ),
                          padding: EdgeInsets.all(20.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text(
                                        "Choose option",
                                        style: TextStyle(
                                            color: Color(0xFF5F5F5F),
                                            fontSize: 24),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            //Camera
                                            InkWell(
                                              // onTap: _pickImageCamera,
                                              child: Row(children: const [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 10, 0),
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                      color: Color(0xFF5F5F5F),
                                                      size: 30,
                                                    )),
                                                Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Color(0xFF5F5F5F)),
                                                )
                                              ]),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            //Gallery
                                            InkWell(
                                              // onTap: _pickImageGallery,
                                              child: Row(children: const [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 10, 0),
                                                    child: Icon(
                                                        Icons
                                                            .add_photo_alternate,
                                                        color:
                                                            Color(0xFF5F5F5F),
                                                        size: 30)),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Color(0xFF5F5F5F)),
                                                )
                                              ]),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            //Remove
                                            InkWell(
                                              // onTap: _remove,
                                              child: Row(children: const [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 10, 0),
                                                    child: Icon(
                                                      Icons.highlight_remove,
                                                      color: Colors.red,
                                                      size: 30,
                                                    )),
                                                Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.red),
                                                )
                                              ]),
                                            )
                                          ],
                                        ),
                                      ));
                                });
                          },
                        ),
                      )
                    ])),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    //Display Name
                    Container(
                      child: Text(
                        "Son Chaeyoung",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 44,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    //ID Bisa dicopas
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID : 8742109310742",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        MaterialButton(
                            minWidth: 15,
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: "8742109310742"));
                            },
                            child: Icon(
                              Icons.content_copy,
                              color: Colors.white,
                            ))
                      ],
                    )),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    //Data email alamat sama tanggal lahir
                    Container(
                      alignment: Alignment.center,
                      child: ListBody(children: [
                        //Email user
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                                Text(
                                  "son.chaeyoung@jyp.co.kr",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                )
                              ]),
                        ),
                        //Adress
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      Icons.place_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                                Text(
                                  "194 Yeulgood Rd. Seoul",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                )
                              ]),
                        ),
                        //Date of Birth
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                                Text(
                                  "23 April 1999",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                )
                              ]),
                        )
                      ]),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    //Bottom Bar jml boting n jml suara
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Jumlah Voting Diikuti
                            Container(
                              height: 100,
                              width: 207,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "Jumlah voting\nyang sudah diikuti",
                                              style: TextStyle(
                                                  color: Color(0xFF5F5F5F),
                                                  fontSize: 14),
                                            ))),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "4",
                                              style: TextStyle(
                                                  color: Color(0xFF5F5F5F),
                                                  fontSize: 24),
                                            ))),
                                  ]),
                            ),
                            //Jumlah Voting Dibuat
                            Container(
                              height: 100,
                              width: 207,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "Jumlah voting\nyang sudah dibuat",
                                              style: TextStyle(
                                                  color: Color(0xFF5F5F5F),
                                                  fontSize: 14),
                                            ))),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  color: Color(0xFF5F5F5F),
                                                  fontSize: 24),
                                            ))),
                                  ]),
                            ),
                          ]),
                    )
                  ],
                ))));
  }
}
