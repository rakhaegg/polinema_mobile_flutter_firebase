
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/Authentication/register.dart';

class Authentication extends StatefulWidget {
  const Authentication({ Key? key }) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToogle = false;

  void toogleScreen(){
    setState(() {
      isToogle = !isToogle;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(isToogle){
      return Register(toogleScreen: toogleScreen);
    }else{
      return Login(toogleScreen : toogleScreen);
    }
  }
}