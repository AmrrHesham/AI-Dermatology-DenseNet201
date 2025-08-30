import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:gp_test_app/components/textnotefiled.dart';
import 'package:gp_test_app/components/validInput.dart';
import 'package:gp_test_app/note/view.dart';

class EditNote extends StatefulWidget {
  final String notedocId;
  final String value;
  final String categorydocId;

  const EditNote({super.key,required this.notedocId, required this.categorydocId, required this.value});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController note= TextEditingController();

   GlobalKey<FormState>formState=GlobalKey<FormState>();
   
    editNote()async {
      CollectionReference collectionnote = 
      FirebaseFirestore.instance.collection('categories').doc(widget.categorydocId).collection("note");

      // Call the user's CollectionReference to add a new user
      if (formState.currentState!.validate()) {
        try {
          // ignore: unused_local_variable
          
          await collectionnote.doc(widget.notedocId).update({"note":note.text}); 
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(categorieId: widget.categorydocId))); 
          
        } catch (e) {
          print("Error $e");
        }
        
      }
     
    }
    @override
  void initState() {
    // TODO: implement initState
    note.text=widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
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
            title: "Edit",
          onPressed: () {
            editNote();
           
          },),
        ],
      )),
    );
  }
}