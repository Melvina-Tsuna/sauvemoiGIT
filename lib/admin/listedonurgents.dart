import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';


class Listedonurgent extends StatefulWidget {
  Listedonurgent ({this.group, this.place,this.mydate});

  //State variables
  final String group,place;
  final DateTime mydate;
  @override
  //_ListedonurgentState createState() => _ListedonurgentState();
  State<StatefulWidget> createState() { return new  _ListedonurgentState();}
}

class _ListedonurgentState extends State<Listedonurgent> {
  final _formKey = GlobalKey<FormState>();
  //final String group, place;
  //final DateTime date;


 // _ListedonurgentState(this.group, this.place, this.date);
  //final String text;
  //SecondScreen({Key key, @required this.text}) : super(key: key);
  //Listedonurgent({this.group},{this.date},{this.place});

  //convert to String
  /*String getFormattedDate(String date) {
    var d = DateTime.parse(date);
    return   [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ][d.month - 1] +
        " " +   d.day.toString() +
        "," +
        d.year.toString();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminheader(context, titleText: "Liste des dons urgents"),
      body: new Stack(

        fit: StackFit.expand,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                 Card(
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
                                "Don urgent",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),

                            ],
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
                              width: 200,
                              child: Center(
                                child: Text(
                                  widget.group,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: 220,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //color: Theme.of(context).primaryColorDark,
                                color: Theme.of(context).primaryColor,
                                child: Container(
                                  height: 25,
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      widget.place,
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
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  //color: Theme.of(context).primaryColorDark,
                                  color: Theme.of(context).primaryColor,
                                  child: Container(
                                    height: 25,
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        //widget.mydate.toString(),
                                        widget.mydate.toString(),
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
                    ),

    /*  Container(child: new Text(widget.group)),
      new Text(widget.place),
                new Text(widget.mydate.toString()),*/

         ],
            ),
          ),
        ],
      ),
    );
  }
}