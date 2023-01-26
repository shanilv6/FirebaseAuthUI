import 'package:flutter/material.dart';
import 'package:modernloginui/screens/auth_page.dart';
import 'package:modernloginui/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  AuthPage(),
    );
  }
}
