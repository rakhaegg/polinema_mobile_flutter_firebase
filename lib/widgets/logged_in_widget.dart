import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/google_sign_id.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text("Logged in"),);
    
    // TODO: implement build
    final user = FirebaseAuth.instance.currentUser;
    String uri = user?.photoURL ?? "";
  
    String email = user?.email ?? null as String;
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
            backgroundImage: NetworkImage(uri),
          ),
          SizedBox(height: 8 ),
          Text(
            "Email" + email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            onPressed: (){
              final provider = 
              Provider.of<GoogleSignInProvider>(context , listen : false );
              provider.logout();
            } , 
            child: Text(
              "Logout"
            ))
        ],
      ),
    );
    
  }
  
}