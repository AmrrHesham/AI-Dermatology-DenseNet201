import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/textformfield.dart';
import 'package:gp_test_app/components/validInput.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  TextEditingController name= TextEditingController();

   GlobalKey<FormState>formState=GlobalKey<FormState>();
   CollectionReference categories = FirebaseFirestore.instance.collection('categories');

    addCategories()async {
      // Call the user's CollectionReference to add a new user
      if (formState.currentState!.validate()) {
        try {
          // ignore: unused_local_variable
          DocumentReference<Object?> response=
           await categories.add({"name":name.text,"id":FirebaseAuth.instance.currentUser!.uid}); 
          Navigator.of(context).pushNamedAndRemoveUntil("homePage",(route)=>false); 
          
        } catch (e) {
          print("Error $e");
        }
        
      }
     
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
      ),
      body: Form(
        key:formState ,
        child: Column(
        children: [
           Container(
            padding: EdgeInsets.all(12),
             child: CustomTextForm(
                

                  hinttext:"Enter name",
                  mycontroller:name,
                  // ignore: body_might_complete_normally_nullable
                  validator: (val){
                    validInput(val!,1,50,"username");
                  }
                ),
           ),
          CustomButtonAuth(
            title: "Add",
          onPressed: () {
            addCategories();
           
          },),
        ],
      )),
    );
  }
}