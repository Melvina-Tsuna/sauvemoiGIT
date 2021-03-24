import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/header.dart';

class Actucomplete extends StatefulWidget {
  @override
  _ActucompleteState createState() => _ActucompleteState();
}

class _ActucompleteState extends State<Actucomplete> {
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Actualite"),
      body: SafeArea(
        child: Container(
          //color: Theme.of(context).accentColor.withGreen(20),
          //margin: EdgeInsets.symmetric(horizontal: 10.0),
          height: 600,
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                  Container(
                  //decoration: new BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
            height: 240,
            color: Colors.transparent,
            //child: Image.network(used_car.imageUrl,fit: BoxFit.fill)
              child:
                    Image(
                      image: AssetImage('assets/images/chumel.jpg'),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
