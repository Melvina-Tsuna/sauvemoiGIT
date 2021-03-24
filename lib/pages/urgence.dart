
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/header.dart';

class Urgence extends StatefulWidget {
  @override
  _UrgenceState createState() => _UrgenceState();
}

class _UrgenceState extends State<Urgence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText :"Urgence" ),
      body: Container(
        child: Text("Urgences de dons de sang"),
      ),
    );
  }
}