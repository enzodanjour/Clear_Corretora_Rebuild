import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

   //The purpose of calling dispose => Prevent memory leaks
  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key:_loginFormKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Seu email "exemplo@hotmail.com"',
                    labelText: 'Email'
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'preencha o email';
                    }
                    else if(!EmailValidator.validate(value)){
                      return 'Informe um email válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Digite sua senha',
                    labelText: 'Senha'
                  ),
                  controller: _senhaController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'Insira uma senha';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    top:29.0,
                    bottom: 22.0 
                  ),
                  child: RaisedButton(
                    child: Text('Entrar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.black,
                    onPressed: () async{
                      if(_loginFormKey.currentState.validate()){
                        try{
                          final FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text, 
                            password: _senhaController.text
                            )).user;
                          Navigator.pushNamed(context, '/');
                        }catch(e){
                          print('Erro é: $e');
                        }
                      }
                    }
                  ),
                ),
                Text('Não tem uma conta? '),
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/cadastrar');
                  }, 
                child: Text('Cadastre-se aqui')
                )
              ],
            ),
          )
          )
      ),
    );
  }
}