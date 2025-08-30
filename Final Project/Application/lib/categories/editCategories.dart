import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/textformfield.dart';
import 'package:gp_test_app/components/validInput.dart';

class EditCategories extends StatefulWidget {
    final String?docid;
    final String oldname;
  const EditCategories({super.key,required this.docid,required this.oldname});


  @override
  State<EditCategories> createState() => _EditCategoriesState();
}

class _EditCategoriesState extends State<EditCategories> {
  TextEditingController name= TextEditingController();

   GlobalKey<FormState>formState=GlobalKey<FormState>();
   CollectionReference categories = FirebaseFirestore.instance.collection('categories');

    editCategories()async {
      // Call the user's CollectionReference to Edit a new user
      if (formState.currentState!.validate()) {
        try {
          // ignore: unused_local_variable
         
           await categories.doc(widget.docid).update({
            "name":name.text,
           });
          
          Navigator.of(context).pushNamedAndRemoveUntil("homePage",(route)=>false); 
          
        } catch (e) {
          print("Error $e");
        }
        
      }
     
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text=widget.oldname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Category"),
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
            title: "Save",
          onPressed: () {
            editCategories();
           
          },),
        ],
      )),
    );
  }
}