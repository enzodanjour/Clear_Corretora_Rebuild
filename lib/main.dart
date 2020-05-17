import 'package:crud_firebase_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppNormal());
}

class AppNormal extends StatelessWidget {
  const AppNormal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo project",
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      home: HomePage(),
    );
  }
}
