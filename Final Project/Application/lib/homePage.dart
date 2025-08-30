import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_test_app/categories/editCategories.dart';
import 'package:gp_test_app/note/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  
 List data=[];
 bool isLoading=true;
  getData()async{
      QuerySnapshot querySnapshot=
         await FirebaseFirestore.instance.collection("categories").where(
          "id",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
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
      // floatingActionButton:FloatingActionButton(
      //  backgroundColor:Colors.green,
      //   child: Icon(Icons.add),
      //   onPressed: (){
      //   Navigator.of(context).pushNamed("addCategories");
      // }),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 96, 159, 98),
        title:Text("skin",style:TextStyle(fontSize: 25,color: Colors.white), ) ,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: ()async{
              GoogleSignIn googleSignIn=GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil("login",(route) => false);
              setState(() {
                
              });
 
            },
             icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body:isLoading==true?
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
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>NoteView(
                  categorieId: data[i].id.toString())));
            },
            onLongPress: (){
               AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                     // title: 'Warning', 
                      desc: 'What do you want to do?',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelText: "Delete",
                      btnOkText: "Edit",
                      btnCancelOnPress: ()async {
                         await FirebaseFirestore.instance.collection("categories").doc(data[i].id).delete();
                        Navigator.of(context).pushReplacementNamed("homePage");
                      },
                      btnOkOnPress: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>EditCategories( 
                            docid: data[i].id,
                             oldname: data[i]["name"])));

                      },
                    ).show();

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset("images/5.png",
                      ),
                      Text("${data[i]["name"]}")  
                    ],
                  ),
                ),
              ),
            ),
          );
          
          },
      ),
    );
  }
}