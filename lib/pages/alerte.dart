import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/urgence.dart';
import 'package:sauve_moi/widgets/header.dart';
import 'package:sauve_moi/widgets/progress.dart';

class Alerte extends StatefulWidget {
  @override
  _AlerteState createState() => _AlerteState();
}

class _AlerteState extends State<Alerte> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

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
    return Scaffold(
      appBar: header(context, titleText: "Alertes"),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left:20),
          height: 600,
          width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                Row(
                  children: [
                    Center(
                      child: Card(
                        /*shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),*/
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 9.0),
                        color: Color.fromRGBO(16, 88, 116, 3),
                        child:Container(
                          width: 300,
                          child: FlatButton(
                            child: Text(
                              "Rappel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Card(
                        /*shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),*/
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        color: Color.fromRGBO(16, 88, 116, 3),
                        child:Container(
                          width: 300,
                          child: FlatButton(
                            child: Text(
                              "Don urgent",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Card(
                       /* shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),*/
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        color: Color.fromRGBO(16, 88, 116, 3),
                        child:Container(
                          width: 300,
                          child: FlatButton(
                            child: Text(
                              "Don annuel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Card(
                        /*shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),*/
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        color: Color.fromRGBO(16, 88, 116, 3),
                        child:Container(
                          width: 300,
                          child: FlatButton(
                            child: Text(
                              "Ajouter don",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
    );
  }
}

class AlerteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Activity Feed Item');
  }
}
