import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/textnotefiled.dart';
import 'package:gp_test_app/components/validInput.dart';
import 'package:gp_test_app/note/view.dart';

class AddNote extends StatefulWidget {
  final String docId;
  const AddNote({super.key,required this.docId});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController note= TextEditingController();

   GlobalKey<FormState>formState=GlobalKey<FormState>();
   
    AddNote()async {
      CollectionReference collectionnote = 
      FirebaseFirestore.instance.collection('categories').doc(widget.docId).collection("note");

      // Call the user's CollectionReference to add a new user
      if (formState.currentState!.validate()) {
        try {
          // ignore: unused_local_variable
          DocumentReference<Object?> response=
          await collectionnote.add({"note":note.text}); 
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(categorieId: widget.docId))); 
          
        } catch (e) {
          print("Error $e");
        }
        
      }
     
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Form(
        key:formState ,
        child: Column(
        children: [
           Container(
            padding: EdgeInsets.all(12),
             child: CustomTextNote(
                  hinttext:"Enter your note",
                  mycontroller:note,
                  // ignore: body_might_complete_normally_nullable
                  validator: (val){
                    validInput(val!,1,50,"username");
                  }
                ),
           ),
          CustomButtonAuth(
            title: "Add",
          onPressed: () {
            AddNote();
           
          },),
        ],
      )),
    );
  }
}