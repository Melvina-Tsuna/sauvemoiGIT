import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Editeractualite extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _EditeractualiteState createState() => _EditeractualiteState();
}

class _EditeractualiteState extends State<Editeractualite> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Editeractualite"),


    );
  }
}