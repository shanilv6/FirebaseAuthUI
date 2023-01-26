import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final user =FirebaseAuth.instance.currentUser!;

 /*Future <void> _signOut() async{
await FirebaseAuth.instance.signOut();
}*/

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>FirebaseAuth.instance.signOut(), icon: const Icon(Icons.logout_outlined))
      ],),
      body:  Center(child: Text("LOGGED IN AS : ${user.email!}",style: const TextStyle(fontSize: 20),)),
    );
  }
}
