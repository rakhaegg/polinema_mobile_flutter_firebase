import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication_service.dart';
import 'package:provider/src/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordContrller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextField(
              controller: passwordContrller,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
            ),
            RaisedButton(
              onPressed: (){
                context.read<AuthenticationServince>().signIn(
                  email: emailController.text.trim(), 
                  password: passwordContrller.text.trim()
                );
              },
              child: Text('Sign In'),
              )
          ],),     
    );
  }
}