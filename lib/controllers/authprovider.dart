
import 'package:flutter/material.dart';
import 'package:governmentjob/data_repository/user_repository.dart';
import 'package:governmentjob/models/user_model.dart';
import 'package:governmentjob/pages/homepage.dart';
import 'package:governmentjob/widgets/custom_snackbar.dart';


import '../data_repository/authentication_repository.dart';
import '../pages/singup/signup_screen.dart';


class AuthProvider extends ChangeNotifier  {


  bool isLoading = false;
  //Textfield controller to get the data from Textfeilds
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(BuildContext context) async {
    try {
       isLoading = true;
    notifyListeners();
     await AuthenticationRepository.loginWithEmailAndPassword(email.text, password.text);

    isLoading=false;
    notifyListeners();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

    } catch (e) {
      isLoading=false;
    notifyListeners();
    errorSnackBar(context, e.toString());
    }
   
  }


   Future<void> registerUser(BuildContext context) async {
      try {
       isLoading = true;
    notifyListeners();
     await AuthenticationRepository.createUserWithEmailAndPassword(email.text, password.text);
     await UserRepository.createUser(UserModel(email: email.text, password: password.text, fullName: fullName.text));
    isLoading=false;
    notifyListeners();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

    } catch (e) {
      isLoading=false;
    notifyListeners();
     errorSnackBar(context, e.toString());
    }
  }



}
