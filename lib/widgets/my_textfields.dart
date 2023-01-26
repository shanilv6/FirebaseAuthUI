import 'package:flutter/material.dart';


class MyTextFields extends StatelessWidget {
 final validators;
  final controllers;
  final String hintText;
  final bool obscureText;
  const MyTextFields({super.key, this.controllers, required this.hintText, required this.obscureText, this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
     validator: validators,
        obscureText: obscureText,
        controller: controllers,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade400
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
