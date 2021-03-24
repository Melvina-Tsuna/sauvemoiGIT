import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Melvina/Desktop/Memoire/code/projects/sauve_moi/lib/pages/adminhome.dart';
import 'package:sauve_moi/pages/chat.dart';
import 'package:sauve_moi/pages/filactualite.dart';
import 'package:sauve_moi/pages/landingpage.dart';
import 'package:sauve_moi/pages/launching.dart';
import 'package:sauve_moi/pages/login.dart';
import 'package:sauve_moi/pages/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SauveMoi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red,
         // primaryColor: Color.fromRGBO(7, 158, 195,1),
        //accentColor: Colors.grey,
       primaryColor: Color.fromRGBO(16, 88, 116,1),
      ),
      //home: Home(),
      //home:Adminhome(),
      initialRoute: Launching.id,
      routes: {
        Launching.id: (context) => Launching(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Adminhome.id: (context) => Adminhome(),
        //Chat.id: (context) => Chat(),
       // Filactualite.id: (context) => Filactualite(),
      },
    );
  }
}
