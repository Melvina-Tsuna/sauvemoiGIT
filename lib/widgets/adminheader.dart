import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/adminhome.dart';
import 'package:sauve_moi/pages/menu.dart';
AppBar adminheader(context, { bool isAppTitle = false, String titleText   }) {
  return AppBar(
    //backgroundColor: Colors.white,
    //backgroundColor: Theme.of(context).primaryColorDark,
    backgroundColor: Theme.of(context).primaryColor,
    /*leading: Hero(
      tag: 'logo',
      child: Container(
        //margin: EdgeInsets.only(left:10),
        //height: 100.0,
        //child: Image.asset("assets/images/logo.png",),
      ),
    ),*/
    title: Text(
      isAppTitle ? "SauveMoi" : titleText ,
      style: TextStyle(
        color:Colors.white,
        // color: Theme.of(context).primaryColorDark,
        // fontFamily:  "Signatra",
        //fontSize: 50.0 ,
      ),
    ),
    actions:<Widget>[
      IconButton(
          icon: Icon(Icons.home),
          //Icon(Icons.close),
          //color: Theme.of(context).primaryColorDark,
          color:Colors.white,
          onPressed: (){
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Adminhome()),
              );
            }
          }
      )
    ],
  );
  /*AppBar(
    title: Text(
      isAppTitle ? "SauveMoi" : titleText ,
      style: TextStyle(
        color: Colors.white,
        fontFamily:  "Signatra",
        fontSize: 50.0 ,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColorDark,
  );*/
}

