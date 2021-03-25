// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sauve_moi/models/utilisateur.dart';
// import 'package:sauve_moi/pages/chat.dart';
// import 'package:sauve_moi/pages/filactualite.dart';
// import 'package:sauve_moi/pages/landingpage.dart';
// import 'package:sauve_moi/pages/launching.dart';
// import 'package:sauve_moi/pages/login.dart';

// class Newregistration extends StatefulWidget {
//   static const String id = "NEWREGISTRATION";
//   @override
//   _NewregistrationState createState() => _NewregistrationState();
// }

// class _NewregistrationState extends State<Newregistration> {
//   String email;
//   String password,nom,prenom;
//   final _formKey = GlobalKey<FormState>();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   Future<void> registerUser() async {
//     try {
//       FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password)
//       await Firestore.instance
//           .collection('users')
//           .document(authResult.user.uid)
//           .setData({
//         'username': username,
//         'email': email,
//       });
//           .then(() => {
//         //Once the user creation has happened successfully, we can add the currentUser into firestore
//         //with the appropriate details.
//         firebase.firestore().collection('users').doc(firebase
//             .auth().currentUser.uid)
//             .set({nom:nom, prenom: prenom, email: email})
//       }
//       );
//       //en cas de succes
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: new Text("Enregistré avec succès",
//               style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12.5),),
//             actions: <Widget>[
//               FlatButton(
//                   child: new Text("OK",
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12.5),),
//                   onPressed: (){
//                     {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Login()),
//                       );
//                     }
//                   }
//               ),
//             ],
//           );
//         },
//       );

//     }
//     /*on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         //print('Compte existant');
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Login(),
//           ),
//         );
//         return e.message;
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Home(),
//           ),
//         );
//       }
//     }*/
//     //catch (e) {print(e);}
//     catch (e) {
//       if (e != null)
//       {
//         print(e);
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: new Text(e.message,
//                 style: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12.5),),
//               actions: <Widget>[
//                 FlatButton(
//                   child: new Text("OK",
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12.5),),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }

//     }
//   }




//   // Validators
//   String emailValidator(String value) {
//     Pattern pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     if (value.isEmpty) return '*Required';
//     if (!regex.hasMatch(value)) return '*Enter a valid email';

//     return null;
//   }

//   String passwordValidator(String value) {
//     if (value.isEmpty) return '*Required';
//     if (value.length < 6) return '*Password too short';

//     return null;
//   }

//   String confirmpasswordValidator(String value) {
//     if (value.isEmpty) return '*Required';
//     if (value.length < 6) return '*Password too short';
//     if (value != password) return '*Password does not match';

//     return null;
//   }


//   final fullNameController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Expanded(
//             child: ListView(
//               children: [
//                 Row(
//                   //mainAxisAlignment: MainAxisAlignment.center ,
//                   //crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Hero(
//                       tag: 'logo',
//                       child: Container(
//                         width: 180.0,
//                         height: 180.0,
//                         child: Image.asset("assets/images/logo.png"),
//                       ),
//                     ),
//                     Text(
//                       "SauveMoi",
//                       style: TextStyle(
//                         fontFamily: "Signatra",
//                         fontSize: 50.0,
//                         color: Theme.of(context).primaryColorDark,
//                         /*colors: [
//                       Theme.of(context).primaryColorDark,
//                       Theme.of(context).accentColor.withGreen(50),
//                     ],*/
//                       ),
//                     ),
//                   ],
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Card(
//                     elevation: 0,
//                     color: Colors.transparent,
//                     margin:
//                     new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
//                     child: Column(
//                       children: [
//                         /*SizedBox(
//                           height: 40.0,
//                         ),
//                         TextFormField(
//                           autofocus: false,
//                           controller: fullNameController,
//                           onChanged: (value) => email = value,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.account_circle_rounded),
//                               border: const OutlineInputBorder(),
//                               labelText: 'Nom complet'),
//                         ),*/
//                         SizedBox(
//                           height: 40.0,
//                         ),
//                         TextFormField(
//                           autofocus: false,
//                           keyboardType: TextInputType.emailAddress,
//                           validator: emailValidator,
//                           onChanged: (value) => email = value,
//                           //onSaved: (value) => email = value,
//                           /*decoration: InputDecoration(
//                                 hintText: "Entrez votre Email...",
//                                 border: const OutlineInputBorder(),
//                               ),*/
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.email),
//                               border: const OutlineInputBorder(),
//                               labelText: 'Entrez email'),
//                         ),
//                         SizedBox(
//                           height: 40.0,
//                         ),
//                         TextFormField(
//                           autofocus: false,
//                           autocorrect: false,
//                           obscureText: true,
//                           validator: passwordValidator,
//                           onChanged: (value) => password = value,
//                           /*decoration: InputDecoration(hintText: "Entrez votre mot de passe...",
//                                 border: const OutlineInputBorder(),
//                               ),*/
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.lock),
//                               border: const OutlineInputBorder(),
//                               labelText: 'Entrez votre mot de passe'),
//                         ),
//                         SizedBox(
//                           height: 40.0,
//                         ),
//                         TextFormField(
//                           autofocus: false,
//                           obscureText: true,
//                           validator: confirmpasswordValidator,
//                           //onSaved: (value) => confirmpassword = value,
//                           /*decoration: InputDecoration(hintText: "Confirmez votre mot de passe...",
//                                 border: const OutlineInputBorder(),
//                               ),*/
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.lock),
//                               border: const OutlineInputBorder(),
//                               labelText: 'Confirmez votre mot de passe'),
//                         ),
//                         SizedBox(
//                           height: 40.0,
//                         ),
//                         CustomButton(
//                           text: "S'enregistrer",
//                           callback: () async {
//                             if (_formKey.currentState.validate()) {
//                               await registerUser();
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /* Expanded(
//               child: Hero(
//                 tag: 'logo',
//                 child: Container(
//                   child: Image.asset(
//                       "assets/images/logo.png",
//                   ),
//                 ),
//               ),
//           ),*/
//         ],
//       ),
//     );
//   }
// }
