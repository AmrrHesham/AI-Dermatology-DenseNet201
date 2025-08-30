
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage22 extends StatefulWidget {
  const HomePage22({super.key});

  @override
  State<HomePage22> createState() => _HomePage22State();
}
class _HomePage22State extends State<HomePage22> {
  final List<String> gridTexts = [
    'Actinic Keratoses',
    'Basal Cell Carcinoma',
    'Benign Keratosis-like Lesions',
    'Dermatofibroma',
    'Melanoma',
    'Melanocytic Nevi ',
    'Vascular Lesions'
  ];

 List data=[];
 bool isLoading=true;
  
  @override
  void initState() {
    
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Skin Lesions Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 12.0, // Spacing between columns
            mainAxisSpacing: 12.0, // Spacing between rows
          ),
          itemCount: gridTexts.length, // Number of items in the grid
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                if (index==0) {
                   Navigator.of(context).pushNamed("page1");
                  print('${gridTexts[index]} button pressed');
                }   
                if (index==1) {
                   Navigator.of(context).pushNamed("page2");
                  print('${gridTexts[index]} button pressed');
                }   
                if (index==2) {
                   Navigator.of(context).pushNamed("page3");
                  print('${gridTexts[index]} button pressed');
                }   
                if (index==3) {
                   Navigator.of(context).pushNamed("page4");
                  print('${gridTexts[index]} button pressed');
                }   
                if (index==4) {
                   Navigator.of(context).pushNamed("page5");
                  print('${gridTexts[index]} button pressed');
                }   
                if (index==5) {
                   Navigator.of(context).pushNamed("page6");
                  print('${gridTexts[index]} button pressed');
                }  
                 if (index==6) {
                   Navigator.of(context).pushNamed("page7");
                  print('${gridTexts[index]} button pressed');
                }              
              },
              style: ElevatedButton.styleFrom(
                // primary: Colors.green, // Button color
              ),
              child: Center(
                child: Text(
                  gridTexts[index],
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}