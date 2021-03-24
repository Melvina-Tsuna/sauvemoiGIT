import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/alerte.dart';
import 'package:sauve_moi/pages/message.dart';
import 'package:sauve_moi/pages/profil.dart';
import 'package:sauve_moi/pages/recherche.dart';
import 'package:sauve_moi/widgets/header.dart';

import 'filactualite.dart';
import 'login.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";
  //final FirebaseUser user;

  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
 // final FirebaseAuth auth = FirebaseAuth.instance;
 // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Widget _offsetPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Don Urgent",
            style: TextStyle(
              color: Theme.of(context).primaryColor, /*fontWeight: FontWeight.w700*/),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Rapel",
            style: TextStyle(
              color: Theme.of(context).primaryColor, /*fontWeight: FontWeight.w700*/),
          ),
        ),
      ],
      icon: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            )
        ),
        child: Icon(Icons.notification_important, color: Theme.of(context).primaryColor,size: 35), //<-- You can give your icon here
      )
  );

  @override
  Widget build(BuildContext context) {
    // return auth.currentUser != null ? Container(child:Text("j'ai fais une gaffe")) : Login();
    /* if (auth.currentUser != null ) {
      print(auth.currentUser.uid);*/
    /*return Scaffold(
        appBar: header(context, titleText :"Fil des discussions" ),
     body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Colors.black12,
      ),
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image(image: AssetImage('assets/images/guser.png'))),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Username",
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Theme
                          .of(context)
                          .accentColor
                          .withGreen(50),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                        "Ville",
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColorDark,
                            fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      color: Theme
                          .of(context)
                          .accentColor
                          .withGreen(50),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Mobile",
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColorDark,
                            fontSize: 13,
                            letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    )

    );*/
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColorDark,
      appBar: header(context, titleText: "Discussions"),
      body: Column(
        children: [
         /* Container(
              padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 80.0,
                      width: 80.0,
                      child: _offsetPopup()
                  )
              )
          ),*/
          Expanded(
            child: ListView(children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                      //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "KANONTE Mariam",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "LAMISSI Praise",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "BIAOU Mariam",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "BENON Ruth",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "KANONTE Mariam",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "LAMISSI Praise",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "BIAOU Mariam",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                //color:Colors.transparent,
                elevation: 8.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 88, 116, 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        "BENON Ruth",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //Icon(Icons.calendar_today_outlined, color: Colors.white),
                          Text("En ligne",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white, size: 30.0)),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

/*
CircleAvatar(
                backgroundImage: AssetImage('assets/images/pp.jpg',),
              ),

ListTile(
                    title: Text("Title $index"),
                    subtitle: Text("Jul 20, 2019"),
                    leading: CircleAvatar(
                      child: Text(
                        "$index",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  */
