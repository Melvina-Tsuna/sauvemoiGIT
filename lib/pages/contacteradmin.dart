import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/header.dart';

class  Contacteradmin extends StatefulWidget {


  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _ContacteradminState createState() => _ContacteradminState();
}

class _ContacteradminState extends State<Contacteradmin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Contacter Administrateur"),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Prendre rendez-vous"),
              Text("Envoyer un message"),
              Text("Signaler une urgence"),
            ],
          ),
        ),
      ),
    );
  }
}