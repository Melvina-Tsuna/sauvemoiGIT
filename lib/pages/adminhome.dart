import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/admin/editeractualite.dart';
import 'package:sauve_moi/admin/editeralertes.dart';
import 'package:sauve_moi/admin/accountlist.dart';
import 'package:sauve_moi/admin/messagesadmin.dart';
import 'package:sauve_moi/admin/paramadmin.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Adminhome extends StatefulWidget {
  static const String id = "ADMINHOME";
  @override
  _AdminhomeState createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {

  //bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Panel Admin"),
      body: PageView(
          children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    //color:Colors.transparent,
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                         /* leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white24))),
                            child: Icon(Icons.post_add,
                              color: Theme.of(context).primaryColor, size: 50.0),
                          ),*/
                          title: Text(
                            "Editer Actualité",
                            style: TextStyle(
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).primaryColor, size: 50.0)),
                    ),
                  ),
                  Card(
                    //color:Colors.transparent,
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text(
                            "Ajouter Alerte",
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).primaryColor, size: 50.0),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Editeralertes()),
                        );
                      },
                      ),
                    ),
                  ),
                  Card(
                    //color:Colors.transparent,
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text(
                            "Définir Statut",
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).primaryColor, size: 50.0)),
                    ),
                  ),
                  Card(
                    //color:Colors.transparent,
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text(
                            "Contacter un donneur spécifique",
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).primaryColor, size: 50.0)),
                    ),
                  ),
                  Card(
                    //color:Colors.transparent,
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 90.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 1.0),
                          title: Text(
                            "Paramètres",
                            style: TextStyle(
                              //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.settings,
                              color: Theme.of(context).primaryColor, size: 30.0),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Paramadmin()),
                          );
                        },

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
