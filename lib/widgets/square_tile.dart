import 'package:flutter/material.dart';
class SquareTile extends StatelessWidget {
  final String ImagePath;
  final onTap;
  const SquareTile({Key? key, required this.ImagePath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(16),color: Colors.grey[200]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImagePath,height: 40,),
        ),
      ),
    );
  }
}
