import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final _registerFormKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro'),
      ),
      body: Form(
        key: _registerFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
             TextFormField(
               decoration: const InputDecoration(
                 icon: Icon(Icons.person),
                 hintText: 'Nome completo',
                 labelText: 'Nome'
               ),
               validator: (value){
                 if(value.isEmpty){
                   return 'Preencha o nome';
                 }
                 return null;
               },
             ),
             TextFormField(
               decoration: const InputDecoration(
                 icon: Icon(Icons.email),
                 hintText: 'Seu email',
                 labelText: 'Email'
               ),
               keyboardType: TextInputType.emailAddress,
               validator: (value){
                 if(value.isEmpty){
                   return 'Preencha o email';
                 }
                 return null;
               }
             ),
             TextFormField(
               decoration: const InputDecoration(
                 icon: Icon(Icons.lock),
                 hintText: 'Digite uma senha',
                 labelText: 'Senha'
               ),
               obscureText: true,
               validator: (value){
                 if(value.isEmpty){
                   return 'Preencha a senha';
                 }
                 return null;
               },
             ),
             TextFormField(
               decoration: const InputDecoration(
                 icon: Icon(Icons.lock_outline),
                 hintText: 'Repita a senha',
                 labelText: 'Repita a senha'
               ),
               obscureText: true,
               validator: (value){
                 //TODO: corrigir em breve, validação falsa.
                 if(value.isEmpty){
                   return'Preencha uma senha';
                 }
                 return null;
               },
             ),
              Container(
                margin: const EdgeInsets.only(top:29.0,bottom: 20.0),
                child: RaisedButton(
                  child: Text('Enviar'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.black,
                  onPressed: (){
                    if(_registerFormKey.currentState.validate()){
                      print('Deu bom');
                    }
                  }
                ),
              ),
              Text('Já possui uma conta?'),
              FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/entrar');
               }, 
                child: Text('Faça login aqui'))
            ],
          ),
          )
        )
    );
  }
}