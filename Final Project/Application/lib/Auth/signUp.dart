// ignore_for_file: unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/customlogoauth.dart';
import 'package:gp_test_app/components/textformfield.dart';
import 'package:gp_test_app/components/validInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
   GlobalKey<FormState>formState=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 34, 55, 34),
      body: 
      
      Stack(
        children:[
            Opacity(
                                opacity: 0.5,
                                child: ClipRRect(
                                  child: Container(
                                   
                                     decoration: const BoxDecoration(
                                      //color: Color.fromARGB(0, 9, 9, 79),
                                    
                                    image: DecorationImage(
                                        image: AssetImage("images/doctors_fight_cancer.png"),
                                          fit: BoxFit.cover,
                                          ),
                                        
                                    ),
                                   
                                        // Foreground widget here
                                                  ),
                                ),
                              ),


          Container(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 50),
                  const CustomLogoAuth(),
                  Container(height: 20),
                  const Text("SignUp",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  const Text("SignUp To Continue Using The App",
                      style: TextStyle(color: Colors.grey)),
                  Container(height: 20),
                  const Text(
                    "username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                    
      
                    // ignore: body_might_complete_normally_nullable
                    validator: (val){
                      return validInput(val!, 3, 20, "username");
                         },
                      hinttext: "ُEnter Your username", mycontroller: username),
                  Container(height: 20),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                   
      
                    // ignore: body_might_complete_normally_nullable
                    validator: (val){
                            return validInput(val!, 3, 40, "email");
                         },
                      hinttext: "ُEnter Your Email", mycontroller: email),
                  Container(height: 10),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                    
      
                    // ignore: body_might_complete_normally_nullable
                    validator: (val){
                           return validInput(val!, 8, 30, "password");
                         },
                      hinttext: "ُEnter Your Password", mycontroller: password),
                 Container(height: 20,)
                ],
              ),
            ),
            CustomButtonAuth(
              title: "SignUp",
              onPressed: () async{
                 if (formState.currentState!.validate()) {
                    try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email:email.text ,
                      password:password.text ,
                    );
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    Navigator.of(context).pushReplacementNamed("login");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Warning',
                        desc: 'The password provided is too weak.',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                        AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Error',
                        desc: 'The account already exists for that email.',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  } catch (e) {
                    print(e);
                  }
                 }
                 
      
            }),
            //=======================================================
            Container(height: 20),
      
            Container(height: 20),
            // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
            InkWell(
              onTap: () {
                Navigator.pop(context) ; 
              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Have An Account ? ",
                  ),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ])),
              ),
            )
          ]),
        ),
        ] 
      ),
   
    );
  }
}