import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp_test_app/ML%20Model.dart';
import 'package:gp_test_app/Pages/mainpage.dart';
import 'package:gp_test_app/Pages/page1.dart';
import 'package:gp_test_app/Pages/page2.dart';
import 'package:gp_test_app/Pages/page3.dart';
import 'package:gp_test_app/Pages/page4.dart';
import 'package:gp_test_app/Pages/page5.dart';
import 'package:gp_test_app/Pages/page6.dart';
import 'package:gp_test_app/Pages/page7.dart';
import 'package:gp_test_app/categories/addCategories.dart';
import 'package:gp_test_app/homePage.dart';
import 'package:gp_test_app/Auth/login.dart';
import 'package:gp_test_app/Auth/signUp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "signup" : (context) => SignUp() , 
        "login" : (context) => Login(),
        "homePage" : (context) => HomePage(),
        "homePage22" : (context) => HomePage22(),
        "addCategories" : (context) => AddCategories(),
        "MlModel" : (context) => MlModel(),
        "page1": (context) => page1(),
        "page2": (context) => page2(),
        "page3": (context) => page3(),
        "page4": (context) => page4(),
        "page5": (context) => page5(),
        "page6": (context) => page6(),
        "page7": (context) => page7(),




      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Login()
    );
  }
}


