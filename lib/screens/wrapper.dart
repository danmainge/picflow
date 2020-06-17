import 'package:flutter/material.dart';
import 'package:picflowapp/screens/authenicate/authenticate.dart';
import 'package:picflowapp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:picflowapp/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
//    return home or authenticate widget
    return Authenticate();
  }
}
