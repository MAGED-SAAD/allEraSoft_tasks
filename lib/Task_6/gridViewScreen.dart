import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Text("Welcome To Pinterest",style: TextStyle(fontSize: 30,color: Colors.grey[700],fontWeight: FontWeight.bold),),
               Text("Pick 5 or More",style: TextStyle(fontSize: 25,color: Colors.grey[500]),),
                SizedBox(height: 20,),
               GridView.builder(
                   itemCount:30 ,
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap:true ,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 20
                 ),
                 itemBuilder:(context, index) {
                     return Container(
                         height: 100,
                         width: 100,
                         decoration:  BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                                 image: NetworkImage("https://www.verdict.co.uk/wp-content/uploads/2018/04/shutterstock_95030080.jpg"),
                                 fit: BoxFit.fill
                             )
                         ),
                         child: Align(
                             alignment: Alignment.bottomCenter,
                             child: Padding(
                               padding: const EdgeInsets.all(5),
                               child: Text("Environment",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                             ))
                     );
                   },

               ),

             ],
           ),
         ),
       ),
     ),


    );
  }

}