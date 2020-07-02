
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:picflowapp/services/auth.dart';

import 'package:picflowapp/shared/constants.dart';



class Settings extends StatelessWidget {
   final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: Text('Settings'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Entypo.home), onPressed: (){
          Navigator.pop(context);
        }), 
      ],
      ),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          FlatButton.icon(
            
            onPressed: ()async{ _auth.signOut();
            
          }, icon: Icon(Entypo.log_out), label: Text('LogOut'),
          color: kPrimaryColor,)
        ],
        
      ),),
    );
  }
}