
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Mesagesadmin extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _MesagesadminState createState() => _MesagesadminState();
}

class _MesagesadminState extends State<Mesagesadmin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Mesagesadmin"),


    );
  }
}