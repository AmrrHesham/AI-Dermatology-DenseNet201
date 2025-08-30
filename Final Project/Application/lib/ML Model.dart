import 'dart:convert';
import 'dart:io';
import 'dart:ui';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_test_app/componant/constants.dart';
import 'package:gp_test_app/componant/custom_outline.dart';
import 'package:gp_test_app/components/custombuttonauth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MlModel extends StatefulWidget
{
  @override
  State<MlModel> createState()=>_MlModel();


}

class _MlModel extends State<MlModel> {
 








  String? result;
  final picker=ImagePicker();
  File? img;
           
  var url="http://192.168.1.10:5000/predict";
  Future pickImage() async{
    PickedFile? pickedFile=await picker.getImage(source: ImageSource.gallery,);
    setState(() {
      img=File(pickedFile!.path);
    });
  }
  upload()async
  {
    print("result====1=====$result");
    final request=http.MultipartRequest("POST",Uri.parse(url));
    final header={"Content_type": "multipart/form-data"};
    print("result=====2====$result");
    request.files.add(http.MultipartFile('image',img!.readAsBytes().asStream(),img!.lengthSync(),
    filename: img!.path.split('/').last));
    print("result=====3====$result");
    request.headers.addAll(header);
    print("result=====33====$result");
    final myRequest=await request.send();
    print("result=====4====$result");
    http.Response res=await http.Response.fromStream(myRequest);
    print("result=====5====$result");
    if(myRequest.statusCode==200){
      final resJson=jsonDecode(res.body);
      print("response here: $resJson");
      result=resJson['class_name'];
      print("result=========$result");
    }else
      {
        print("Error======== ${myRequest.statusCode}");
      }

    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 55, 34),
      extendBody: true,
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 159, 98),
        title:Text("SKIN Diseases APP",style:TextStyle(fontSize: 25,color: Colors.white), ) ,
        actions: [
          IconButton(
            onPressed: ()async{
              GoogleSignIn googleSignIn=GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil("login",(route) => false);
              setState(() {
                
              });
 
            },
             icon: Icon(Icons.exit_to_app,color: Colors.white,)),
        ],
      ),
      body: SizedBox(
         height: screenHeight,
    width: screenWidth,
   child: 
   SingleChildScrollView(
     child: Stack(children: [
       Opacity(
                opacity: 0.3,
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
      //  Positioned(
      //    top: screenHeight*0.1,
      //    left: -88,
      //    child: Container(
      // height: 166,
      // width: 166,
      // decoration: BoxDecoration(
      // shape: BoxShape.circle,
      // color: Constants.kPinkColor
      // ),
      //      child: BackdropFilter(
      //        filter: ImageFilter.blur(
      //          sigmaX: 200,
      //          sigmaY: 200,
      //        ),
      //      ),
      // ),
      //  ),
      //  Positioned(
      //    top: screenHeight * 0.3,
      //    right: -100,
      //    child: Container(
      //      height: 200,
      //      width: 200,
      //      decoration: const BoxDecoration(
      //        shape: BoxShape.circle,
      //        color: Constants.kGreenColor,
      //      ),
      //      child: BackdropFilter(
      //        filter: ImageFilter.blur(
      //          sigmaX: 200,
      //          sigmaY: 200,
      //        ),
      //        child: Container(
      //          height: 200,
      //          width: 200,
      //          color: Colors.transparent,
      //        ),
      //      ),
      //    ),
      //  ),
       SafeArea(child:
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: screenHeight*0.02,),
           CustomOutline(
             strokeWidth: 4,
             radius: screenWidth * 0.8,
             padding: const EdgeInsets.all(4),
             width: screenWidth * 0.8,
             height: screenWidth * 0.8,
             gradient: LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 colors: [
                   Constants.kPinkColor,
                   Constants.kPinkColor.withOpacity(0),
                   Constants.kGreenColor.withOpacity(0.1),
                   Constants.kGreenColor
                 ],
                 stops: const [
                   0.2,
                   0.4,
                   0.6,
                   1
                 ]),
             child: Center(
               child: img == null
                   ? Container(
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     alignment: Alignment.bottomLeft,
                     image:
                     AssetImage('images/hh.jpg'),
                   ),
                 ),
               )
                   :  Container(
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     alignment: Alignment.bottomLeft,
                     image:
                     FileImage(img!),
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: screenHeight*0.04,),
           Center(
             child: img==null?
             Text('THE MODEL HAS NOT BEEN PREDICTED',textAlign: TextAlign.center,
             style: TextStyle(color: Constants.kWhiteColor.withOpacity(0.85,),fontSize: screenHeight<= 667 ? 18 : 34,
               fontWeight: FontWeight.w700,),
             )
                 :
             Text('Result from Model Ml: $result',textAlign: TextAlign.center,
               style: TextStyle(color: Constants.kWhiteColor.withOpacity(0.85,),fontSize: screenHeight<= 667 ? 18 : 34,
                 fontWeight: FontWeight.w700,),
             )
   
           ),
           SizedBox(height: screenHeight*0.02,),
           CustomOutline(
             strokeWidth: 3,
             radius: 20,
             padding: const EdgeInsets.all(3),
             width: 160,
             height: 38,
             gradient: const LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               //colors: [Constants.kPinkColor, Constants.kGreenColor],
               colors: [Colors.green, Colors.green],
   
             ),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 gradient: LinearGradient(
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                  //  colors: [
                  //    Constants.kPinkColor.withOpacity(0.5),
                  //    Constants.kGreenColor.withOpacity(0.5)
                  //  ],
                    colors: [
                     Colors.green.withOpacity(0.5),
                     Colors.green.withOpacity(0.5)
                   ],
                 ),
               ),
               child:ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.white12,),
   
                 ),
                 onPressed: (){
                   pickImage();
                 },
                 child: Text('Pick Image Here',style: TextStyle(
                   fontSize: 14,
                   color: Constants.kWhiteColor,
                 )),
               ),
             ),
           ),
           SizedBox(
             height: 5,
           ),
              SizedBox(height: screenHeight*0.03,),
           CustomOutline(
             strokeWidth: 3,
             radius: 20,
             padding: const EdgeInsets.all(3),
             width: 160,
             height: 38,
             gradient: const LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               //colors: [Constants.kPinkColor, Constants.kGreenColor],
               colors: [Colors.green, Colors.green],
   
             ),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 gradient: LinearGradient(
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                  //  colors: [
                  //    Constants.kPinkColor.withOpacity(0.5),
                  //    Constants.kGreenColor.withOpacity(0.5)
                  //  ],
                    colors: [
                     Colors.green.withOpacity(0.5),
                     Colors.green.withOpacity(0.5)
                   ],
                 ),
               ),
               child:ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.white12,),
   
                 ),
                 onPressed: (){
                   pickImage();
                 },
                 child: Text('Pick Camera',style: TextStyle(
                   fontSize: 14,
                   color: Constants.kWhiteColor,
                 )),
               ),
             ),
           ),
           SizedBox(
             height: 5,
           ),
           CustomOutline(
             strokeWidth: 3,
             radius: 20,
             padding: const EdgeInsets.all(3),
             width: 160,
             height: 38,
             gradient: const LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
              // colors: [Constants.kPinkColor, Constants.kGreenColor],
               colors: [Colors.green, Colors.green],
   
             ),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 gradient: LinearGradient(
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                  //  colors: [
                  //    Constants.kPinkColor.withOpacity(0.5),
                  //    Constants.kGreenColor.withOpacity(0.5)
                  //  ],
                   colors: [
                     Colors.green.withOpacity(0.5),
                     Colors.green.withOpacity(0.5)
                   ],
                 ),
               ),
               child:ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.white12,),
   
                 ),
                 onPressed: (){
                   upload();
   
                 },
                 child: Text('Upload Image',style: TextStyle(
                   fontSize: 14,
                   color: Constants.kWhiteColor,
                 )),
               ),
             ),
           ),
          CustomButtonAuth(
            title: "go to info",
            onPressed:(){
              Navigator.of(context).pushNamed("homePage22");
            }
          ),
         ],
       ),),
      ]
     ),
   ),
      ),
     );
  }
}