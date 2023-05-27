
import 'package:firebase_auth/firebase_auth.dart';



class AuthenticationRepository  {

static final FirebaseAuth _auth=FirebaseAuth.instance;

static  Future<dynamic> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
     return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
  
    }catch(e) {
      rethrow;
    }
   
  }

static  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    try {
    return  await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      rethrow;
    } 
 
  }

 static Future<void> logOut() async => await _auth.signOut();

  
}
