import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Gestioncompte extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _GestioncompteState createState() => _GestioncompteState();
}

class _GestioncompteState extends State<Gestioncompte> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "ABASSI Assan"),
      body: SafeArea(
        
      ),
    );
  }
}