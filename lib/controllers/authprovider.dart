
import 'package:flutter/material.dart';
import 'package:governmentjob/data_repository/user_repository.dart';
import 'package:governmentjob/models/user_model.dart';
import 'package:governmentjob/pages/homepage.dart';
import 'package:governmentjob/pages/singup/signup_screen.dart';
import 'package:governmentjob/pages/weolcome_screen.dart';
import 'package:governmentjob/services/pushnotificaiton_service.dart';
import 'package:governmentjob/widgets/custom_snackbar.dart';


import '../data_repository/authentication_repository.dart';
import '../pages/login/login_screen.dart';


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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));

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
       String? fcm= await FirebasePushNotificationService().getFirebaseToken();
     await AuthenticationRepository.createUserWithEmailAndPassword(email.text, password.text);
     await UserRepository.createUser(UserModel(email: email.text, password: password.text, fullName: fullName.text,fcm: fcm));
    isLoading=false;
    notifyListeners();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));

    } catch (e) {
      isLoading=false;
    notifyListeners();
     errorSnackBar(context, e.toString());
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await AuthenticationRepository.logOut();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen()));
    } catch (e) {
      isLoading=false;
      notifyListeners();
      errorSnackBar(context, e.toString());
    }

  }
}
