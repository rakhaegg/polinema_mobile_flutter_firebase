import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication_service.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {


  final FirebaseAuth auth = FirebaseAuth.instance;
  
  String? inputDATA() {
    final User? user = auth.currentUser;
     String? phot = user?.photoURL;
     return phot;
  }
    String? email() {
    final User? user = auth.currentUser;
     String? phot = user?.email;
     return phot;
  }





  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Logged In",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8,),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(inputDATA() ?? ""),
          ),
          SizedBox(height: 8,),
          Text(
            "Email" + (email() ?? ""),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            onPressed: (){
              context.read<AuthenticationServince>().signOut();
            }, 
            child: Text(
              "Logout"
            )
            )
        ],
      ),
    );
    
  }
}