import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Menuadmin extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _MenuadminState createState() => _MenuadminState();
}

class _MenuadminState extends State<Menuadmin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: adminheader(context, titleText: "Menu princial"),
        body:SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Text("Nouveaux comptes"),//il peut en creer aussi ou editer les donees sensibles
                Text("Messages"),
              ],
            ),
          ),
        ),
    );
  }
}
