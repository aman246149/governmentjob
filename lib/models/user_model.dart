import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String? phoneNo;
  final String password;
  final String? imageLink;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    this.phoneNo,
    this.imageLink
  });

  //firebase does not stores data directly we need to convert data into json format
  toJson() {
    return {
      "fullName": fullName,
      "email": email,
    };
  }

  //fetching model
  // Map user fetched from firebase to userModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;//.data provides complete object .get provides particular value e.g. email
        return UserModel(
            id: document.id,
            email: data["email"],//here "Email" is namne of column in database
            password: data["password"],
            fullName: data["fullName"],
            phoneNo: data["phone"],
          imageLink:data["imageLink"]
        );
  }
}
