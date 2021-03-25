import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauve_moi/pages/Home.dart';
import 'package:sauve_moi/pages/adminhome.dart';
import 'package:sauve_moi/pages/chat.dart';
import 'package:sauve_moi/pages/filactualite.dart';
import 'package:sauve_moi/pages/landingpage.dart';
import 'package:sauve_moi/pages/launching.dart';
import 'package:sauve_moi/pages/login.dart';
import 'package:sauve_moi/pages/registration.dart';
import 'package:sauve_moi/services/authentication_service.dart';

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
        primaryColor: Color.fromRGBO(16, 88, 116, 1),
      ),
      //home: Home(),
      //home:Adminhome(),
      // initialRoute: Launching.id,
      routes: {
        Launching.id: (context) => Launching(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Adminhome.id: (context) => Adminhome(),
        //Chat.id: (context) => Chat(),
        // Filactualite.id: (context) => Filactualite(),
      },
      home: WrapperPage(),
    );
  }
}

class WrapperPage extends StatefulWidget {
  WrapperPage({Key key}) : super(key: key);

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  AuthenticationService _authenticationService = AuthenticationService();
  String currentUserId;
  @override
  void initState() {
    super.initState();
    getId();
  }

  getId() async {
    var result;
    try {
      result = await _authenticationService.getUserId();
      print(result);
    } catch (e) {}

    if (result == null) {
      Navigator.pushAndRemoveUntil(
        context,
        // MaterialPageRoute(builder: (context) => Home()),
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        // MaterialPageRoute(builder: (context) => Home()),
        MaterialPageRoute(builder: (context) => Home()),
        (Route<dynamic> route) => false,
      );
    }
    setState(() {
      currentUserId = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
