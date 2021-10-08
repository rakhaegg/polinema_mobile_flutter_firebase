import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/authentication.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/services/authentication_services/auth_servics.dart';
import 'package:provider/provider.dart';



void main() async{
  
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var xx = null;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _init = Firebase.initializeApp();
    
    return FutureBuilder(
      future: _init ,
      builder: (context , snapshot){
        if( snapshot.hasError){
          return ErrorWidget();
        }else if(snapshot.hasData){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthServices>.value(value: AuthServices()),
              StreamProvider<User?>.value(
              value: AuthServices().user, 
              initialData: null
              )
            ],
            child: MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.red
                ),
                debugShowCheckedModeBanner: false,
                home: Authentication(),
            )
          );
        }else{
          return Loading();
        }
      }
    );
      
  }
  
}
class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.error),
            Text("Something Went Weong")
          ],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}