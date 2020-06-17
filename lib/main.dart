import 'package:flutter/material.dart';
import 'package:picflowapp/screens/wrapper.dart';
import 'package:picflowapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:picflowapp/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'picflow',
        home: Wrapper(),
      ),
    );
  }
}
