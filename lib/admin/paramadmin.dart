import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/main.dart';
import 'package:sauve_moi/pages/launching.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Paramadmin extends StatefulWidget {
  @override
  _ParamadminState createState() => _ParamadminState();
}

class _ParamadminState extends State<Paramadmin> {

  void _signOut() {
    FirebaseAuth.instance.signOut();
    FirebaseUser user = FirebaseAuth.instance.currentUser;
    //print('$user');
    runApp(
         MaterialApp(
          home:  MyApp(),
        )

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Paramètres"),
      body: PageView(children: [
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
                          title: Text(
                            "Se déconnecter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          trailing: Icon(Icons.login_outlined,
                              color: Theme.of(context).primaryColor, size: 50.0),
                        onTap: (){
                            _signOut();
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
