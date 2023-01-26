import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
 final ontap;
 final String text;

  const MyButton({Key? key, required this.ontap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: 340,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black
        ),
      child:  Center(child: Text(text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
      ),),
      ),
    );
  }
}
