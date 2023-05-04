import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/pages/home_page.dart';
import 'package:new_app/pages/login_or_register_page.dart';
import 'package:new_app/pages/login_page.dart';
import 'package:new_app/pages/camera_page.dart';
import 'package:new_app/pages/onboarding_first_page.dart';
import 'package:new_app/pages/splash_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is logged in return homepage
          if (snapshot.hasData) {
            return OnBoardScreen();
          }
          //is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
