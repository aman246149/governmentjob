
import 'package:firebase_auth/firebase_auth.dart';

import '../exception/login_email_password_failure.dart';
import '../exception/signup_email_password_failure.dart';

class AuthenticationRepository  {

static final FirebaseAuth _auth=FirebaseAuth.instance;

static  Future<dynamic> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
     return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser.value != null ? Get.offAll(() => const DashboardScreen())
      //     : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
   
  }

static  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    try {
    return  await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();
      return ex.message;
    }
 
  }

 static Future<void> logOut() async => await _auth.signOut();

  
}
