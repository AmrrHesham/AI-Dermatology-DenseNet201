// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/customlogoauth.dart';
import 'package:gp_test_app/components/textformfield.dart';
import 'package:gp_test_app/components/validInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

   GlobalKey<FormState>formState=GlobalKey<FormState>();
   bool isLoading=false;

  Future signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
       if (googleUser==null) {
         return;
       }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
       Navigator.of(context).pushNamedAndRemoveUntil("MlModel",(route)=>false);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 55, 34),
      body:isLoading==true? Center(
              child:CircularProgressIndicator(color: Colors.green,),): 
              
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
                const Text("Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Container(height: 10),
                const Text("Login To Continue Using The App",
                    style: TextStyle(color: Colors.grey)),
                Container(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  
                     // ignore: body_might_complete_normally_nullable
                     validator: (val){
                       return validInput(val!, 8, 100, "email");
                     },
                    hinttext: "ُEnter Your Email", 
                    mycontroller: email),
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
                  hinttext: "ُEnter Your Password", 
                  mycontroller: password,
                  
                  ),
                InkWell(
                  onTap: ()async{
                    if (email.text=="") {
                      AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Warning',
                      desc: 'Please write your email and then click on forget password.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
          
                    }
                      try {
                         await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email.text);
                     AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Warning',
                      desc: 'Please go to your email and use the link to change your password.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
          
          
                      } catch (e) {
                        print(e);
                         AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Error',
                      desc: 'Make sure the correct email address you entered.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();   
                      }
                      
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           CustomButtonAuth(
            title: "login",
           
            onPressed: () async{
             if (formState.currentState!.validate()) {
              try {
                isLoading=true;
                setState(() {
                  
                });
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
            isLoading=false;
                setState(() {
                  
                });
             if (credential.user!.emailVerified) {
           Navigator.of(context).pushReplacementNamed("MlModel");
           
             }else{
          AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Warning',
                      desc: 'Please go to your email and verify your account.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
          
             }
          
            } on FirebaseAuthException catch (e) {
           isLoading=false;
                setState(() {
                  
                });
          if (e.code == 'user-not-found') {
            print('=======No user found for that email.');
            AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Error',
                      desc: 'No user found for that email.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
          } else if (e.code == 'wrong-password') {
            print('======Wrong password provided for that user.');
            AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Error',
                      desc: 'Wrong password provided for that user.',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
          }
             }  
             }
          }
          ),
          Container(height: 20),
          
          MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color.fromARGB(255, 15, 33, 18),
              textColor: Colors.white,
              onPressed: () {
                signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google  "),
                  Image.asset(
                    "images/4.png",
                    width: 20,
                  )
                ],
              )),
          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("signup") ; 
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't Have An Account ? ",
                ),
                TextSpan(
                    text: "Register",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
            ]),
             ),
       ]),
    
    
    );
  }
}