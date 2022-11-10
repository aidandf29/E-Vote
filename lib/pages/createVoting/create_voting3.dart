import 'package:flutter/material.dart';
import 'package:evote/pages/createVoting/multi_form.dart';

void main() => runApp(createVoting3());

class createVoting3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF1DCC8C),
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiForm(),
    );
  }
}