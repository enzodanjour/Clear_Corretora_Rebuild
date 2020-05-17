import 'package:crud_firebase_flutter/pages/home_page.dart';
import 'package:crud_firebase_flutter/pages/login_page.dart';
import 'package:crud_firebase_flutter/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppNormal());
}

class AppNormal extends StatefulWidget {
  const AppNormal({Key key}) : super(key: key);
  

  @override
  _AppNormalState createState() => _AppNormalState();
}

class _AppNormalState extends State<AppNormal> {
  bool isAuthenticated = false;

  void initState(){
    super.initState();

      FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      // This is called when "sign-in" and "sign-out" is triggerd
      print('onAuthStateChanged called!!!');
      
      // If user signed-in already "user" is not null
      setState(() {
        isAuthenticated = user != null;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo project",
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(isAuthenticated:isAuthenticated),
        '/entrar': (context) => LoginPage(),
        '/cadastrar': (context) =>RegisterPage()
      },
    );
  }
}
