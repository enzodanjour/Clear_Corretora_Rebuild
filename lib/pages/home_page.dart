import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           DrawerHeader(
             decoration: BoxDecoration(
               color: Colors.greenAccent
             ),
             child: Text(
               'Cabeçario do drawer',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 26.0
               ),
             ),
           ),
           ListTile(
             leading: Icon(Icons.exit_to_app),
             title: Text('Entrar'),
             onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/entrar');
             }
           ),
           ListTile(
             leading: Icon(Icons.account_box),
             title: Text('Cadastrar'),
             onTap: () {
               Navigator.pop(context);
               Navigator.pushNamed(context, '/cadastrar');
             },
           )
          ],
        ),
      ),
      body: Center(
        child: Text('')
      ),
    );
  }
}
