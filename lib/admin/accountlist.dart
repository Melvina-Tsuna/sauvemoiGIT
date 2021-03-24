import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/adminheader.dart';

class Accountlist extends StatefulWidget {
  // const Chat({Key key, this.user}) : super(key: key);
  @override
  _AccountlistState createState() => _AccountlistState();
}

class _AccountlistState extends State<Accountlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: adminheader(context, titleText: "Liste des comptes"),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search_outlined,color:Colors.white),
              onPressed: null)
        ],
        //centertitle: true,
        title: Text("Rechercher"),
        //Par id ou username ou groupe sanguin ou geolocalisation
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            //height: 50,
            child: Text("A",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                fontSize: 30,
              ),),
          ),
          Container(
            /*decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),)),*/
           child: ListTile(
              leading:Text("ID"),
              title: Text('ABASSI Assan'),
            ),
          ),
          Container(
           /* decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),)),*/
            child: ListTile(
              leading:Text("ID"),
              title: Text('ABLESSOU Harris'),
            ),
          ),
          Container(
            /* decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),)),*/
            child: ListTile(
              leading:Text("ID"),
              title: Text('ABLESSOU Harris'),
            ),
          ),
          Container(

            child: ListTile(
              leading:Text("ID"),
              title: Text('ADON Aurelie'),
            ),
          ),
          Container(
            child: Container(
              width: 200,
              height: 1,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide( //                   <--- left side
                      color: Colors.grey,
                      width: 1.0,
                    ),)),
            ),
          ),

          Container(
            alignment: AlignmentDirectional.center,
            //height: 50,
            child: Text("B",
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 30,
              ),),
          ),
          Container(
           /* decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff000000),
                  width: 1,
                )),*/
            child: ListTile(
              leading:Text("ID"),
              title: Text('BIAOU Mariam'),
            ),
          ),
          ListTile(
            leading:Text("ID"),
            title: Text('BAMIDELE Anne'),
          ),
          ListTile(
            leading:Text("ID"),
            title: Text('BADOUN Christ'),
          ),
          ListTile(
            leading:Text("ID"),
            title: Text('BADOUN Christ'),
          ),
        ],
      ),
    );
  }
}
