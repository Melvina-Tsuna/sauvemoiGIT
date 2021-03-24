import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/profil.dart';
import 'package:sauve_moi/widgets/header.dart';

class DemandeStatut extends StatefulWidget {
  @override
  _DemandeStatutState createState() => _DemandeStatutState();
}

class _DemandeStatutState extends State<DemandeStatut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: " Demande de Statut"),
      body: SafeArea(
        child: Container(
          //color: Theme.of(context).accentColor.withGreen(20),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          //height: 600,
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Center(
                        heightFactor: 3,
                        child: Text(
                          "Formulaire de demande de Statut",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      //color: Theme.of(context).primaryColor,
                        color: Colors.transparent,
                      elevation: 0,
                        //elevation: 8.0,
                        //margin: new EdgeInsets.symmetric(
                        // horizontal: 10.0, vertical: 6.0),
                        child: Container(
                      //height: 50,
                      //color: Colors.yellow,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Center(
                                  heightFactor: 1,
                                  child: Text(
                                    "Avez-vous deja fait un don?",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FlatButton.icon(
                                  label: Text('Oui',style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                  icon: Radio(
                                      /*value: Gender.MALE,
                                    groupValue: _genderValue,
                                    onChanged: (Gender value) {
                                      setState(() {
                                        _genderValue = value;
                                      });
                                    },*/
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      // _genderValue = Gender.MALE;
                                    });
                                  },
                                ),
                                FlatButton.icon(
                                  label: Text('Non',style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                  icon: Radio(
                                      /*value: Gender.FEMALE,
                                    groupValue: _genderValue,
                                    onChanged: (Gender value) {
                                      setState(() {
                                        _genderValue = value;
                                      });
                                    },*/
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      //  _genderValue = Gender.FEMALE;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    //Si non, veuillez prendre rendez-vous pour un don
                    //si oui, questions suivantes
                    Card(
                        color: Colors.transparent,
                        elevation: 0,
                        //margin: new EdgeInsets.symmetric(
                        // horizontal: 10.0, vertical: 6.0),
                        child: Container(
                      //height: 50,
                      //color: Colors.yellow,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Center(
                                  heightFactor: 1,
                                  child: Text(
                                    "Avez-vous une carte de donneur?",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FlatButton.icon(
                                  label: Text('Oui',style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                  icon: Radio(
                                      /*value: Gender.MALE,
                                    groupValue: _genderValue,
                                    onChanged: (Gender value) {
                                      setState(() {
                                        _genderValue = value;
                                      });
                                    },*/
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      // _genderValue = Gender.MALE;
                                    });
                                  },
                                ),
                                FlatButton.icon(
                                  label: Text('Non',style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                  icon: Radio(
                                      /*value: Gender.FEMALE,
                                    groupValue: _genderValue,
                                    onChanged: (Gender value) {
                                      setState(() {
                                        _genderValue = value;
                                      });
                                    },*/
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      //  _genderValue = Gender.FEMALE;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    //S'il n'a pas de carte de donneur,lui demander combien de don il a deja fait.if not
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: new EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 6.0),
                      child:Column(
                        children: [
                          Container(
                            height: 50,
                            //color: Colors.yellow,
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText:
                                    "Numéro de votre carte de donneur"
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
                    Card(
                      //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 90.0, vertical: 6.0),
                      child: Container(
                        height: 50,
                        // width: 100,
                        //color: Colors.yellow,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                  child: Text(
                                    "Valider",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: (){
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Profil()),
                                      );
                                    }
                                  }

                              ),
                            ],
                          ),
                        ),
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
