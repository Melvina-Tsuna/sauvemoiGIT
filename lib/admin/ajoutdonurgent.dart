import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/admin/editeralertes.dart';
import 'package:sauve_moi/admin/listedonurgents.dart';
import 'package:sauve_moi/pages/launching.dart';
import 'package:sauve_moi/widgets/adminheader.dart';


class Ajoudonurgent extends StatefulWidget{



  @override
  //_AjoudonurgentState createState() => _AjoudonurgentState();
  State<StatefulWidget> createState() { return new  _AjoudonurgentState();}
}

class _AjoudonurgentState extends State<Ajoudonurgent> {
  final _formKey = GlobalKey<FormState>();
//State variables
   String group,place;
   String mydate;


 /* String dateValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value)) return '*Enter a valid date';

    return null;
  }*/
  void nouveaudon() {
   // Navigator.push(context, MaterialPageRoute(builder: (context) => Editeralertes()),);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Listedonurgent(group:this.group,place:this.place, mydate:this.mydate),
        ));
  }

  //bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Alerte de don urgent"),
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
                          onChanged: (value) => group = value,
                          //onSaved: (value) => email = value,
                          /*decoration: InputDecoration(
                                hintText: "Entrez votre Email...",
                                border: const OutlineInputBorder(),
                              ),*/
                          decoration: InputDecoration(
                              //icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: 'Groupe sanguin'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                    DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd/MMM/yyyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
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
                      onChanged: (value) => mydate = value ,
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
                          onChanged: (value) => place = value,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.email),
                              border: const OutlineInputBorder(),
                              labelText: 'Lieu'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomButton(
                          text: "Valider",
                          callback: ()  {
                            if (_formKey.currentState.validate()) {
                              nouveaudon();
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


