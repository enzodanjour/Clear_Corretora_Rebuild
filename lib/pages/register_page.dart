import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  //The purpose of calling dispose => Prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmaSenhaController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro'),
      ),
      body: 
        SingleChildScrollView(
        child: Form(
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
                 controller: _nameController,
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
                 controller: _emailController,
                 validator: (value){
                   if(value.isEmpty){
                     return 'Preencha o email';
                   }
                   else if(!EmailValidator.validate(value)){
                     return 'Informe um email válido';
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
                 controller: _senhaController,
                 validator: (value){
                   if(value.isEmpty){
                     return 'Preencha a senha';
                   }
                   else if(value != _confirmaSenhaController.text){
                     return 'Senhas diferentes';
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
                 controller: _confirmaSenhaController,
                 validator: (value){
                   if(value.isEmpty){
                     return'Preencha uma senha';
                   }
                   else if(value != _senhaController.text){
                     return 'Senhas diferentes';
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
                        print('nome: ${_nameController.text}');
                        print('email: ${_emailController.text}');
                        print('Senha: ${_senhaController.text}');
                        print('confirmaSenha ${_confirmaSenhaController.text}');
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
          ),
      )
    );
  }
}