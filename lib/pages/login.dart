import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/Home.dart';
import 'package:sauve_moi/pages/editprofil.dart';
import 'package:sauve_moi/pages/landingpage.dart';
import 'package:sauve_moi/pages/profil.dart';
import 'package:sauve_moi/pages/registration.dart';
import 'package:sauve_moi/services/authentication_service.dart';

import 'adminhome.dart';
import 'chat.dart';
import 'launching.dart';

class Login extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  AuthenticationService _authenticationService = AuthenticationService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future<void> loginUser() async {
    try {
      //UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential.user.uid);
      _authenticationService.saveUserId(userCredential.user);

      if (email == "admin@gmail.com") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(
                "Bienvenue Admin",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5),
              ),
              actions: <Widget>[
                FlatButton(
                    child: new Text(
                      "OK",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.5),
                    ),
                    onPressed: () {
                      {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Adminhome(),),);
                        // Navigator.of(context).pushNamed(Adminhome.id);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Adminhome()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    }),
              ],
            );
          },
        );
      } else {
        //en cas de succes

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(
                "Connecté avec succès",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5),
              ),
              actions: <Widget>[
                FlatButton(
                    child: new Text(
                      "OK",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.5),
                    ),
                    onPressed: () {
                      {
                        Navigator.pushAndRemoveUntil(
                          context,
                          // MaterialPageRoute(builder: (context) => Home()),
                          MaterialPageRoute(builder: (context) => Editprofil()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    }),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              e.message,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text(
                  "OK",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Registration()),
          (Route<dynamic> route) => false,
        );
      }
    }

    /*
     catch (e) {
      if (e != null)
      {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(e.message,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5),),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

    }
     */
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value)) return '*Enter a valid email';

    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) return '*Required';
    if (value.length < 6) return '*Password too short';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          /* Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),*/
          Expanded(
            child: ListView(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center ,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        width: 180.0,
                        height: 180.0,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                    Text(
                      "SauveMoi",
                      style: TextStyle(
                        fontFamily: "Signatra",
                        fontSize: 50.0,
                        color: Theme.of(context).primaryColorDark,
                        /*colors: [
                    Theme.of(context).primaryColorDark,
                    Theme.of(context).accentColor.withGreen(50),
                  ],*/
                      ),
                    ),
                  ],
                ),
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
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                          onChanged: (value) => email = value,
                          //onSaved: (value) => email = value,
                          /*decoration: InputDecoration(
                                hintText: "Entrez votre Email...",
                                border: const OutlineInputBorder(),
                              ),*/
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: 'Entrez email'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          autocorrect: false,
                          obscureText: true,
                          validator: passwordValidator,
                          onChanged: (value) => password = value,
                          /*decoration: InputDecoration(hintText: "Entrez votre mot de passe...",
                                border: const OutlineInputBorder(),
                              ),*/
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              border: const OutlineInputBorder(),
                              labelText: 'Entrez votre mot de passe'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomButton(
                          text: "Se connecter",
                          callback: () async {
                            if (_formKey.currentState.validate()) {
                              await loginUser();
                            }
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            Text("Vous n'avez pas de compte?"),
                            TextButton(
                                child: Text("Inscrivez-vous ici"),
                              onPressed:()
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Registration()),
                                  );
                            }),
                              ],
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

/*
 Card(
                  elevation: 0,
                  color: Colors.transparent,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value,
                        decoration: InputDecoration(
                          hintText: "Entrez votre Email...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextField(
                        autocorrect: false,
                        obscureText: true,
                        onChanged: (value) => password = value,
                        decoration: InputDecoration(hintText: "Entrez votre mot de passe...",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      CustomButton(
                        text: "Se connecter",
                        callback: () async{
                          await loginUser();
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),

                    ],
                  ),
                ),
 */

/*void _validateLoginInput() async {
  final FormState form = _formKey.currentState;
  if (_formKey.currentState.validate()) {
    form.save();
    _sheetController.setState(() {
      _loading = true;
    });
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      switch (error.code) {
        case "ERROR_USER_NOT_FOUND":
          {
            _sheetController.setState(() {
              errorMsg =
              "There is no user with such entries. Please try again.";

              _loading = false;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "ERROR_WRONG_PASSWORD":
          {
            _sheetController.setState(() {
              errorMsg = "Password doesn\'t match your email.";
              _loading = false;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        default:
          {
            _sheetController.setState(() {
              errorMsg = "";
            });
          }
      }
    }
  } else {
    setState(() {
      _autoValidate = true;
    });
  }
}*/
/*
void loginSheet() {
      _sheetController = _scaffoldKey.currentState
          .showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).primaryColor),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 20, top: 60),
                                child: CustomTextField(
                                  onSaved: (input) {
                                    _email = input;
                                  },
                                  validator: emailValidator,
                                  icon: Icon(Icons.email),
                                  hint: "EMAIL",
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: CustomTextField(
                                  icon: Icon(Icons.lock),
                                  obsecure: true,
                                  onSaved: (input) => _password = input,
                                  validator: (input) =>
                                  input.isEmpty ? "*Required" : null,
                                  hint: "PASSWORD",
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: _loading == true
                                  ? CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    primaryColor),
                              )
                                  : Container(
                                child: filledButton(
                                    "LOGIN",
                                    Colors.white,
                                    primaryColor,
                                    primaryColor,
                                    Colors.white,
                                    _validateLoginInput),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }
 */
/*
 return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            logo(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Padding(
              child: Container(
                child: filledButton("LOGIN", primaryColor, Colors.white,
                    Colors.white, primaryColor, loginSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 20,
                  right: 20),
            ),
            Padding(
              child: Container(
                child: outlineButton(registerSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}
 */
