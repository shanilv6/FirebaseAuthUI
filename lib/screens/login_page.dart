import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernloginui/screens/home_page.dart';
import 'package:modernloginui/services/auth_service.dart';
import 'package:modernloginui/widgets/my_button.dart';
import 'package:modernloginui/widgets/my_textfields.dart';
import 'package:modernloginui/widgets/square_tile.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formemailkey = GlobalKey<FormState>();
  final formpasswordlkey = GlobalKey<FormState>();
  final TextEditingController emailcontrollers = TextEditingController();
  final TextEditingController passwordcontrollers = TextEditingController();

  void signUserIn() async {
    //show loading screen
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    //try signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontrollers.text, password: passwordcontrollers.text);
      //pop the loading circle
      Get.back();
    //  Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      //pop the loading circle
     // Navigator.pop(context);
      Get.back();
      showErrorMessage(e.code);
    }
    if (formemailkey.currentState!.validate()) {
      if (formpasswordlkey.currentState!.validate()) {
        Get.to(HomePage());
      }
    }
  }
  //error message to user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              message,
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Welcome back,you\'ve been missed!",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: formemailkey,
              child: MyTextFields(
                validators: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the email";
                  }
                },
                controllers: emailcontrollers,
                hintText: "Email",
                obscureText: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: formpasswordlkey,
              child: MyTextFields(
                controllers: passwordcontrollers,
                validators: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Password";
                  } else if (value.length < 4) {
                    return 'Minimum length 4 required';
                  }
                  return null;
                },
                hintText: "Password",
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              ontap: signUserIn,
              text: 'Sign In',
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const Expanded(
                      child: Divider(color: Colors.black,
                    thickness: 0.5,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                  ),
                  const Expanded(
                      child: Divider(color: Colors.black,
                    thickness: 0.5,
                  )),
                ],
              ),
            ),
             const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SquareTile(
                  onTap:()=> AuthService().signInWithGoogle(),
                  ImagePath: "assets/google.png",
                ),
                SizedBox(
                  width: 20,
                ),
                SquareTile(
                  ImagePath: "assets/apple.png",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    " Register now",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
