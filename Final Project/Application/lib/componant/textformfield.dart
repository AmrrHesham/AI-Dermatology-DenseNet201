import 'package:flutter/material.dart';


class CustomTextForm extends StatelessWidget {
  final String hinttext ; 
  final Widget prefixIcon;
  final Widget? sifixIcon;
  final TextEditingController mycontroller ; 
  final String? Function(String?)? validator;
  final String? Function(String?)? suffixonpressed;

  final bool obscur;

  const CustomTextForm({
    Key?key,
    required this.hinttext,
    required this.mycontroller,
    required this.validator,
    required this.prefixIcon,
    required this.obscur,
      this.sifixIcon,
      this.suffixonpressed,


      
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator:validator ,
      controller: mycontroller ,
      obscureText: obscur,
      onChanged: suffixonpressed,
      decoration: InputDecoration(
        prefixIcon:prefixIcon,
        suffixIcon: sifixIcon,
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 16, color: Colors.black38,fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 184, 184, 184))),
          enabledBorder: OutlineInputBorder(
            
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
