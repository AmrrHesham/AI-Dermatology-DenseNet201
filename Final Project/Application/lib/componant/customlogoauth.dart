import 'package:flutter/material.dart';
class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(70)),
                    child: Image.asset(
                      "images/logo.PNG",
                      height: 100,
                      // fit: BoxFit.fill,
                    )),
              ); 
  }
}