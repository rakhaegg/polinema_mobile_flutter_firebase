import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/homeScreens/home_screens.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {

  late  Function toogleScreen;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user != null){
      return HomeScreen();
    }else{
      return Login(toogleScreen: toogleScreen);
    }
  }
}