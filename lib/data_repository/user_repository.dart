
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



import '../models/user_model.dart';

class UserRepository {
 

static  final _db = FirebaseFirestore.instance;

  // -- Storing data
 static Future<dynamic>  createUser(UserModel user) async {
   try {
      await _db.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(user.toJson()) ;
   } catch (e) {
     rethrow;
   }
        
 
  }

  // fetch user details
 static Future<UserModel> getUserDetails(String email) async {
      try {
          final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
      } catch (e) {
        rethrow;
      }
  }

  // // fetch all users
  // Future<List<UserModel>> allUsers() async {
  //   final snapshot = await _db.collection("Users").get();

  //   final userData =
  //       snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
  //   return userData;
  // }

}
