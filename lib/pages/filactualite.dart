import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/actucomplete.dart';
import 'package:sauve_moi/widgets/header.dart';
import 'package:sauve_moi/widgets/progress.dart';

//final usersRef = FirebaseFirestore.instance.collection('users');

class Filactualite extends StatefulWidget {
  static const String id = "FIL";

  @override
  _FilactualiteState createState() => _FilactualiteState();
}

class _FilactualiteState extends State<Filactualite> {
  Widget _offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Don Urgent",
              style: TextStyle(
                color: Theme.of(context)
                    .primaryColor, /*fontWeight: FontWeight.w700*/
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Rapel",
              style: TextStyle(
                color: Theme.of(context)
                    .primaryColor, /*fontWeight: FontWeight.w700*/
              ),
            ),
          ),
        ],
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: StadiumBorder(
                side:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              )),
          child: Icon(Icons.notification_important,
              color: Theme.of(context).primaryColor,
              size: 35), //<-- You can give your icon here
        ),
        offset: Offset(100, 50),
      );
  /* @override
  void initState() {
    getUsers();
    //getUserById();
    super.initState();
  }*/
  /* getUsers() {
    usersRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data);
        print(doc.id);
        print(doc.exists);
      });
    });
  }*/
  /*@override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true ),
      body: Text("Actuplus"),
    );
  }*/
//Added from internet

  @override
  Widget build(context) {
    return Scaffold(

        // backgroundColor: Theme.of(context).primaryColor,
        appBar: header(context, titleText: "Actualités"),
        body: FutureBuilder(
          //future: getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Container(
                    height: 27,
                    child: Text("Very test"
                        /*"Name: ${snapshot.data.data()['name']}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20),*/
                        ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Column(
                children: [
                  /*Center(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          width: 120,
                          height: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                    children: [
                                      Text('Actualités',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily:  "Signatra",
                                          fontSize: 25.0,
                                        ),),
                                    ]
                                ),
                              ]
                          ),
                        ),
                      )
                  ),*/
                  //Notification
                  Container(
                      padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: _offsetPopup()))),
                  Expanded(
                    child: ListView(
                      children: [
                        //Elements
                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.white24))),
                                child: Image.asset(
                                  'assets/images/chumel.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(
                                "Depuis 10 ans,la Transfusion Sanguine au Bénin connait...",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                              subtitle: Row(
                                children: <Widget>[
                                  //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                  Text("09 Janvier 2020",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white, size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }
                            ),
                          ),
                        ),

                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.white24))),
                                  child: Image.asset(
                                    'assets/images/donurg.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  "Nouvelle campagne pour le don de sang...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Row(
                                  children: <Widget>[
                                    //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                    Text("15 Janvier 2020",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }),
                          ),
                        ),
                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.white24))),
                                  child: Image.asset(
                                    'assets/images/campagne.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  "Autre campagne pour le don de sang...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Row(
                                  children: <Widget>[
                                    //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                    Text("25 Janvier 2020",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }),
                          ),
                        ),
                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.white24))),
                                  child: Image.asset(
                                    'assets/images/chumel.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  "Depuis 10 ans,la Transfusion Sanguine au Bénin connait...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Row(
                                  children: <Widget>[
                                    //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                    Text("09 Janvier 2020",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }),
                          ),
                        ),
                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.white24))),
                                  child: Image.asset(
                                    'assets/images/donurg.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  "Nouvelle campagne pour le don de sang...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Row(
                                  children: <Widget>[
                                    //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                    Text("15 Janvier 2020",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }),
                          ),
                        ),
                        Card(
                          //color:Colors.transparent,
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                            //decoration: BoxDecoration(color:Colors.grey),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(16, 88, 116, 3),
                            ),
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.white24))),
                                  child: Image.asset(
                                    'assets/images/campagne.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  "Autre campagne pour le don de sang...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                subtitle: Row(
                                  children: <Widget>[
                                    //Icon(Icons.calendar_today_outlined, color: Colors.white),
                                    Text("25 Janvier 2020",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                                onTap: (){
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Actucomplete()),
                                    );
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }

  /*void getUsernameFromUserId(String userId) {
    FirebaseFirestore.instance.collection("test").doc(userId).get().then((value) {
      print(value.data());
    });
  }*/
}

/*
Card(
                          color: Colors.red,
                          child: ListTile(
                            leading: Image(
                              image: AssetImage('assets/images/campagne.jpg'),
                            ),
                            title: Text('Comment obtenir,disposer et servir le...',
                              style: TextStyle(
                                color: Colors.white,
                                // fontFamily:  "Signatra",
                                //fontSize: 50.0 ,
                              ),),
                            subtitle: Text('Ce mardi ',
                              style: TextStyle(
                                color: Colors.white,
                                // fontFamily:  "Signatra",
                                //fontSize: 50.0 ,
                              ),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ) ,
                        ),*/

/*
child:
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
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
                );
              },
              itemCount: 15,
            ),
 */

//sang ou ses dérivés afin de sauver'
//'le patient ou la patiente en détresse vitale sans compromettre son avenir?
//Depuis 10 ans, la Transfusion Sanguine au Bénin connait de sérieuses difficultés pour
//assurer la disponibilité et la sécurité transfusionnelle. Ainsi, les pénuries cycliques
// persistent et mettent en péril la vie de nos mères et enfants; de nos soeurs et frères.

/*Expanded(
child: ListView.builder(
itemBuilder: (context, index) {
return Card(
child: ListTile(
title: Text("Depuis 10 ans, la Transfusion Sanguine au Bénin connait..."),
subtitle: Text("Date Jul 20, 2019"),
leading: Image.asset(
'assets/images/chumel.jpg',

fit: BoxFit.fill,
),
trailing: Icon(Icons.keyboard_arrow_right),
),
);
},
itemCount: 15,
),
),



final makeCard = Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile,
      ),
    );

 final makeListTile = ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),
        title: Text(
          "Introduction to Driving",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
 */
