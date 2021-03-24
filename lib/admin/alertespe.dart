import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Alertespe extends StatefulWidget {
  @override
  _AlertespeState createState() => _AlertespeState();
}

class _AlertespeState extends State<Alertespe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: adminheader(context, titleText: "Alertes spéciales"),
    body: PageView(children: []),
    );
  }
}
