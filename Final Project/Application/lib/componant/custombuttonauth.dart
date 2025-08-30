import 'package:flutter/material.dart';
import 'package:gp_test_app/constant/constant.dart';



class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color:defaultColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(title,style: TextStyle(fontSize: 16,),),
    );
  }
}