
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_test_app/note/add.dart';

class NoteView extends StatefulWidget {
  final String categorieId;
  const NoteView({super.key, required this.categorieId});

  @override
  State<NoteView> createState() => _NoteViewState();
}
class _NoteViewState extends State<NoteView> {
  
 List data=[];
 bool isLoading=true;
  getData()async{
      QuerySnapshot querySnapshot=
         await FirebaseFirestore.instance.
         collection("categories").doc(widget.categorieId).collection("note").get();
      data.addAll(querySnapshot.docs);
      isLoading=false;
      setState(() {
        
      });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
      backgroundColor:Colors.green,
        child: Icon(Icons.add),
        
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddNote(docId: widget.categorieId)));
      }),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 159, 98),
        title:Text("Skin") ,
      ),
      body:WillPopScope(child: isLoading==true?
             Center(
              child:CircularProgressIndicator(color: Colors.green,),)
             : GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          mainAxisExtent: 230),
          // ignore: body_might_complete_normally_nullable
          itemBuilder: (context,i){
          return  InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                    //  Image.asset("images/5.png",
                     // ),
                      Text("${data[i]["note"]}")  
                    ],
                  ),
                ),
              ),
            ),
          );
          
          },
      ),
      onWillPop: (){
        Navigator.of(context).pushNamedAndRemoveUntil("homePage", (route) => false);
        return Future.value(false);
      })
    );
  }
}