import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernloginui/screens/login_or_registerpage.dart';
import 'package:modernloginui/screens/login_page.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user logged in
        if (snapshot.hasData) {
          return HomePage();
        }
        //user not loggedin
        else {
          return const LoginOrRegisterPage();
        }
      },
    ));
  }
}
