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

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final _formKey = GlobalKey<FormState>();
  String username;
  FirestoreService firestoreService = FirestoreService();
  AuthenticationService _authenticationService = AuthenticationService();
  String currentUserId = '';

  @override
  void initState() {
    super.initState();
    getId();
  }

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
        adresse: 'cotonou',
        birthDate: '30/10/996',
        email: 'email@gmail.com',
        phone: '+229 61757616',
        sexe: 'M',
        userName: username,
      ));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Mise ajour avec succès",
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
      appBar: header(context, titleText: "Profil"),
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
                    Center(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0.0,
                        /* margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),*/
                        child: Container(
                          color: Colors.transparent,
                          height: 150,
                          width: 151,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                //decoration: new BoxDecoration(color: Colors.white),
                                alignment: Alignment.center,
                                height: 240,
                                color: Colors.transparent,
                                //child: Image.network(used_car.imageUrl,fit: BoxFit.fill)
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(300.0),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/pp.jpg'))),
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Card(
                                      color: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      //margin: EdgeInsets.all(10.0),
                                      child: Center(
                                        heightFactor: 2,
                                        widthFactor: 2,
                                        child: Icon(Icons.add_a_photo,
                                            color: Colors.white),
                                      ))),
                            ],
                          ),

                          //width: 150,
                          /*decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/pp.jpg")),
                        ),*/
                        ),
                      ),
                    ),
                    Card(
                      //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        height: 50,
                        //color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            "Name or Username",
                            style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5),
                          ),
                          trailing:
                              Icon(Icons.edit_outlined, color: Colors.grey),
                        ),


                      ),
                    ),
                    Card(
                      //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        height: 50,
                        //color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(Icons.add_ic_call,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            "+22900000000",
                            style: TextStyle(
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5),
                          ),
                          trailing:
                              Icon(Icons.edit_outlined, color: Colors.grey),
                        ),
                      ),
                    ),
                    Card(
                      //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        height: 50,
                        //color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(Icons.calendar_today,
                              color: Theme.of(context).primaryColor),
                          //color: Theme.of(context).primaryColor, size: 50.0),
                          title: Text(
                            "07-08-2000",
                            style: TextStyle(
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5),
                          ),
                          trailing:
                              Icon(Icons.edit_outlined, color: Colors.grey),
                        ),
                      ),
                    ),
                    Card(
                        //elevation: 8.0,
                        //margin: new EdgeInsets.symmetric(
                        // horizontal: 10.0, vertical: 6.0),
                        child: Container(
                      height: 50,
                      //color: Colors.yellow,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FlatButton.icon(
                              label: Text('M'),
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
                              label: Text('F'),
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
                            FlatButton.icon(
                              label: Text(''),
                              icon: Radio(
                                  /* value: Gender.OTHER,
                                    groupValue: _genderValue,
                                    onChanged: (Gender value) {
                                      setState(() {
                                        _genderValue = value;
                                      });
                                    },*/
                                  ),
                              onPressed: () {
                                setState(() {
                                  // _genderValue = Gender.OTHER;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    )),
                    Card(
                      //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        height: 50,
                        //color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(Icons.place,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            "Cotonou",
                            style: TextStyle(
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5),
                          ),
                          trailing:
                              Icon(Icons.edit_outlined, color: Colors.grey),
                        ),
                      ),
                    ),
                    //Demander Statut
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
                              FlatButton.icon(
                                  label: Text(
                                    "Sauvegarder",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  icon: Icon(Icons.post_add,
                                      color: Theme.of(context).primaryColor),
                                  onPressed: () {
                                    {
                                      submit();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           DemandeStatut()),
                                      // );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Statut defini
                    /* Card(
                      elevation: 8,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 55, vertical: 6.0),
                      child: Column(
                        children:[
                        Container(
                          width: 220,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Statut",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //color: Theme.of(context).primaryColorDark,
                                color: Theme.of(context).primaryColor,
                                child: Container(
                                  height: 30,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Donneur actif",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 220,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Groupe Sanguin",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //color: Theme.of(context).primaryColorDark,
                                color: Theme.of(context).primaryColor,
                                child: Container(
                                  height: 25,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "A+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 220,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Nombre de dons",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                               // color: Theme.of(context).primaryColorDark,
                                color: Theme.of(context).primaryColor,
                                child: Container(
                                  height: 25,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      ),
                    ),*/
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

/*@override
  Widget build(BuildContext context) {
    return Container(

      child: Text("Chat"),
    );
  }
}
Container(
                                height: 150,
                                color: Colors.blue,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage:

                                ),
                              ),

 child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage('assets/images/pp.jpg'),
                                ),
Container(
                          width: 220,
                          child:Row(
                            children: <Widget>[
                              Text(
                                "Statut",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Theme.of(context).primaryColorDark,
                                child: Container(
                                  height: 30,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Donneur actif",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
/*Container(
                          width: 220,
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                "Groupe Sanguin",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Theme.of(context).primaryColorDark,
                                child: Container(
                                  height: 25,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "A+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
/*

 Container(
                          width: 220,
                          child:Row(
                            children: <Widget>[
                              Text(
                                "Nombre de dons",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Theme.of(context).primaryColorDark,
                                child: Container(
                                  height: 25,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
