import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/google_sign_id.dart';
import 'package:flutter_application_1/widgets/logged_in_widget.dart';
import 'package:flutter_application_1/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider<GoogleSignInProvider>(
      create:  (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          final provider = Provider.of<GoogleSignInProvider>(context);

          if(provider.isSigningIn){
            return buildLoading();
          }else if(snapshot.hasData){
            return LoggedInWidget();
          } else{
            return SignUpWidget();
          }
        },
      )
    ),
  );

  Widget buildLoading() => Center(child: CircularProgressIndicator()); 
   
  
}