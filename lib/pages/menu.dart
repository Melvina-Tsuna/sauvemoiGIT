
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> _items = ['Partager application', 'Contacter administrateur','prendre rendez-vous','a propos de nous'];

 String _currentItem = 'Partager application';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
    /* items: _items.map((String dropDownItem){
        return DropdownMenuItem<String>(
          value:dropDownItem,
          child:Text(dropDownItem),
        );
      }).toList,
      onChanged: (String selectedItem) {
        setState(() {
          this._currentItem = selectedItem;
        });
      },
      value: _currentItem,*/
    );

  }
}