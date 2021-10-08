import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication_service.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:provider/provider.dart';



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var xx = null;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return MultiProvider(
        providers: [
          Provider<AuthenticationServince>(
            create : (_) => AuthenticationServince(FirebaseAuth.instance)

          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationServince>().authStateChanges,
            initialData : null,
          ),
        ],
        child: MaterialApp(
          title : 'Material Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthenticationWrapper(),
        ),
      );
  }
  
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final firebaseuser  = context.watch<User?>();

      if(firebaseuser != null){
        return HomePage();
      }
    
    return SignIn();
  }
}
