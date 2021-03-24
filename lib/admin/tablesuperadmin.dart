

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Tablesuperadmin extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _TablesuperadminState createState() => _TablesuperadminState();
}

class _TablesuperadminState extends State<Tablesuperadmin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Mesagesadmin"),
    );
  }
}