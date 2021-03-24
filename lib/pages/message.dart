import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/widgets/header.dart';
import 'package:sauve_moi/widgets/progress.dart';

class Message extends StatelessWidget {

  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.red[900] : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                  text,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
return Scaffold(
      appBar:header(context, titleText :"Messagerie" ),
      body: circularProgress(),
    );
 */