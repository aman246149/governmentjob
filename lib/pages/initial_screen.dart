import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:governmentjob/pages/homepage.dart";
import "package:governmentjob/pages/tabbar/tabbar.dart";
import "./weolcome_screen.dart";

class InitialScreen extends StatefulWidget {
   InitialScreen({Key? key}) : super(key: key);
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: widget.firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const BottomNavigationBarWidget();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                "${snapshot.error}",
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
          }

          return const WelcomeScreen();
        },
      ),
    );
  }
}
