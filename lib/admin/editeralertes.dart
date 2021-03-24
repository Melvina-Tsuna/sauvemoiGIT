import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/admin/ajoutdonurgent.dart';
import 'package:sauve_moi/admin/alertespe.dart';
import 'package:sauve_moi/admin/listedonurgents.dart';
import 'package:sauve_moi/pages/urgence.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Editeralertes extends StatefulWidget {
  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _EditeralertesState createState() => _EditeralertesState();
}

class _EditeralertesState extends State<Editeralertes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Editer Alertes/Types d'alertes"),
      body: SafeArea(
        child:Column(
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
                          title: Text(
                            "Don urgent",
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
                            MaterialPageRoute(builder: (context) => Ajoudonurgent()),
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
                          "Alerte spécifique ",
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
                            MaterialPageRoute(builder: (context) => Alertespe()),
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
                          "Liste des dons urgents ",
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
                            MaterialPageRoute(builder: (context) => Listedonurgent()),
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
                          "Liste des alertes spécifique ",
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
                            MaterialPageRoute(builder: (context) => Alertespe()),
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
      ),
    );
  }
}
