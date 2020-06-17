import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:picflowapp/services/auth.dart';
import 'package:picflowapp/screens/home/user_list.dart';
import 'package:provider/provider.dart';
import 'package:picflowapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().userinfo,
      child: Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          title: Text('picflow'),
          backgroundColor: Colors.grey[800],
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
        body: UserinfoList(),
      ),
    );
  }
}
