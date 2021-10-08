import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServince{
  
  final FirebaseAuth _firesbaseAuth;
  
  
  AuthenticationServince(this._firesbaseAuth);

  Stream<User?> get authStateChanges => _firesbaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firesbaseAuth.signOut();
  }

  Future<String?> signIn({ required String email ,required String password}) async{
     try {
        await _firesbaseAuth.signInWithEmailAndPassword(email: email, password: password);
        return "Signed In"; 
     } on FirebaseAuthException catch (e) {
       return e.message;
     }
  }


  Future<String?> singUp({required String email ,  required String password}) async{
    try {
        await _firesbaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}