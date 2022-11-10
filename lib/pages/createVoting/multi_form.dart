import 'package:flutter/material.dart';
import 'package:evote/pages/createVoting/empty_state.dart';
import 'package:evote/pages/createVoting/form.dart';
import 'package:evote/pages/createVoting/user.dart';
import 'package:collection/collection.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        // title: Text(),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Text('Save'),
        //     textColor: Colors.white,
        //     onPressed: onSave,
        //   )
        // ],
        backgroundColor: Color(0xff06304b),
      ),
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xff06304b),
          //     Color(0xFFFFFFFF),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // )
          color: Color(0xff06304b),
          
        ),
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
              ),
      ),
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
  void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Users'),
              ),
              body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(data[i].fullName.substring(0, 1)),
                  ),
                  title: Text(data[i].fullName),
                  subtitle: Text(data[i].email),
                ),
              ),
            ),
          ),
        );
      }
    }
  }
}
