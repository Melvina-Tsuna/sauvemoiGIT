


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/create_account.dart';
import 'package:sauve_moi/pages/profil.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'menu.dart';
import 'login.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class LandingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TestApp',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:
        StreamBuilder<auth.User>(
          stream: auth.FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<auth.User> snapshot) {
            if(snapshot.hasData) {
              print("There is a user logged in");
              return Profil();
            }
            else {
              return Login();
            }
          },
        )
    );
  }
}