import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/adminhome.dart';
import 'package:sauve_moi/pages/registration.dart';
import 'package:sauve_moi/widgets/header.dart';
import 'package:sauve_moi/widgets/progress.dart';

import 'login.dart';

/*class Launching extends StatefulWidget {
  @override
  _LaunchingState createState() => _LaunchingState();
}

class _LaunchingState extends State<Launching> */
class Launching extends StatelessWidget{
  static const String id = "HOMESCREEN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                  fontSize:50.0,
                  color: Theme.of(context).primaryColorDark,
                  /*colors: [
                    Theme.of(context).primaryColorDark,
                    Theme.of(context).accentColor.withGreen(50),
                  ],*/
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          CustomButton(
            text: "Se connecter",
            callback: (){
              Navigator.of(context).pushNamed(Login.id);
            },
          ),
          CustomButton(
            text: "S'inscrire",
            callback: (){
              Navigator.of(context).pushNamed(Registration.id);
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget{
   final VoidCallback callback;
   final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build( BuildContext context){
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}



