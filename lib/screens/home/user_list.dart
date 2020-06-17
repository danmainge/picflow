import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserinfoList extends StatefulWidget {
  @override
  _UserinfoListState createState() => _UserinfoListState();
}

class _UserinfoListState extends State<UserinfoList> {
  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<QuerySnapshot>(context);
//    print(userinfo.documents);
    for (var doc in userinfo.documents) {
      print(doc.data);
    }
    return Container();
  }
}
