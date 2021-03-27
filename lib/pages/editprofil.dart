import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/models/user.dart';
import 'package:sauve_moi/pages/DemandeStatut.dart';
import 'package:sauve_moi/pages/Home.dart';
import 'package:sauve_moi/pages/alerte.dart';
import 'package:sauve_moi/pages/contacteradmin.dart';
import 'package:sauve_moi/services/authentication_service.dart';
import 'package:sauve_moi/services/firestoreService.dart';
import 'package:sauve_moi/widgets/header.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'launching.dart';

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
/*body: FutureBuilder(
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

 */

class Editprofil extends StatefulWidget {
  @override
  _EditprofilState createState() => _EditprofilState();
}

class _EditprofilState extends State<Editprofil> {
  final _formKey = GlobalKey<FormState>();
  String username,numtel,adresse;
  String birthdate;
  //String sexe = 'Homme';

  FirestoreService firestoreService = FirestoreService();
  AuthenticationService _authenticationService = AuthenticationService();
  String currentUserId = '';

  @override
  void initState() {
    super.initState();
    getId();
  }
String sexe;
  List<String> sexes =["Homme","Femme"];

  getId() async {
    var result;
    try {
      result = await _authenticationService.getUserId();
      print(result);
    } catch (e) {}

    setState(() {
      currentUserId = result;
    });
  }

  submit() async {
    // _formKey.currentState.save();
    try {
      await firestoreService.createUser(Users(
        idUser: currentUserId,
       /* adresse: 'cotonou',
        birthDate: '30/10/996',
        email: 'email@gmail.com',
        phone: '+229 61757616',
        sexe: 'M',*/
        adresse: adresse,
        birthDate: birthdate,
       // email: 'email@gmail.com',
        phone: numtel,
        sexe: sexe,
        userName: username,
      ));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Enregistré avec succès",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5),
            ),
            actions: <Widget>[
              TextButton(
                  child: new Text(
                    "OK",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5),
                  ),
                  onPressed: () {
                    {
                      Navigator.pop(context);
                    }
                  }),
            ],
          );
        },
      );
    } catch (e) {}

    // Navigator.pop(context, username);
  }

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Créez votre profil"),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    margin:
                    new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          //keyboardType: TextInputType.emailAddress,
                          //validator: emailValidator,
                          onChanged: (value) => username = value,
                          //onSaved: (value) => email = value,
                          /*decoration: InputDecoration(
                                hintText: "Entrez votre Email...",
                                border: const OutlineInputBorder(),
                              ),*/
                          decoration: InputDecoration(
                            //icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: "Nom d'utilisateur"),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          //keyboardType: TextInputType.emailAddress,
                          //validator: emailValidator,
                          onChanged: (value) => numtel = value,
                          //onSaved: (value) => email = value,
                          /*decoration: InputDecoration(
                                hintText: "Entrez votre Email...",
                                border: const OutlineInputBorder(),
                              ),*/
                          decoration: InputDecoration(
                            //icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: "Numero de telephone"),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd/MMM/yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          selectableDayPredicate: (date) {
                            // Disable weekend days to select from the calendar
                            if (date.weekday == 6 || date.weekday == 7) {
                              return false;
                            }
                            return true;
                          },
                          //onChanged: (val) => print(val),
                          //onChanged: (value) => birthdate = value as DateTime,
                          onChanged: (value) => birthdate = value,
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          //keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => adresse = value,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: 'Adresse'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        /*DropdownButton<String>(
                          value: sexe,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              sexe = newValue!;
                            });
                          },
                          items: <String>['Homme', 'Femme']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )*/
                        DropDownField(
                            onValueChanged: (dynamic value){
                              sexe = value;
                            },
                          value: sexes,
                          required:false,
                          hintText: "Choisissez un genre",
                          labelText:'Genres',
                          items:sexes,

                        ),
                        CustomButton(
                          text: "Valider",
                          callback: ()  {
                            if (_formKey.currentState.validate()) {
                              submit();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

