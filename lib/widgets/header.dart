import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/menu.dart';

void _select(value){
  switch(value){
    case 'Home':
      break;
    case 'Order':
      break;
  }
  print(value);
}

AppBar header(context, { bool isAppTitle = false, String titleText   }) {
  return AppBar(
    elevation: 8,
    //backgroundColor: Colors.transparent,
    backgroundColor: Theme.of(context).primaryColor,
    centerTitle: true,
    title: Text(
        isAppTitle ? "SauveMoi" : titleText ,
      style: TextStyle(
        //color: Theme.of(context).primaryColorDark,
       // fontFamily:  "Signatra",
        //fontSize: 50.0 ,
      ),
    ),
    actions: [
      //color: Theme.of(context).primaryColorDark,
      //Icon(Icons.ac_unit,color:Theme.of(context).primaryColorDark ),
      PopupMenuButton(
        onSelected: _select,
        itemBuilder: (BuildContext context) {
          return {'Partager application', 'Contacter administrateur','Prendre rendez-vous','A propos de nous'}.map((String choice) {
            return PopupMenuItem(
              value: choice,
              child: Text(choice,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                ),
              ),
                   // fontWeight: FontWeight.bold,
                    //fontSize: 12.5),),
            );
          }).toList();
        },
      ),],

  );

}
/*AppBar(
    title: Text(
      isAppTitle ? "SauveMoi" : titleText ,
      style: TextStyle(
        color: Colors.white,
        fontFamily:  "Signatra",
        fontSize: 50.0 ,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColorDark,
  );*/
//Peut etre reutilise
/*actions:<Widget>[
      IconButton(
          icon: Icon(Icons.menu),
          //Icon(Icons.close),
          color: Theme.of(context).primaryColorDark,
          onPressed: (){
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            }
          }
      )
    ],*/

