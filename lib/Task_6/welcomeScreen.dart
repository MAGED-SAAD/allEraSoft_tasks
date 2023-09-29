import 'dart:ffi';

import 'package:cubiterasoft/Task_6/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(15),
          child: Column(

            children: [
              SizedBox(height:40,),
            Align(
              alignment: Alignment.center,
                child: Text("Welcome",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
            ),

              SizedBox(height:5,),

              Text("Please Login or Signup to continue Using the App",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
              SizedBox(height:50,),
              
              Image.network("https://snacknation.com/wp-content/uploads/2022/03/diversity-inclusion-activities.png"),
              SizedBox(height:40,),
              Text("Login Using Social Media",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
              SizedBox(height:40,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(

                  children: [
                   Expanded(
                       child: Container(
                         height: 70,
                         color: Colors.blue[700],
                         child: Image.network("https://ww2.freelogovectors.net/wp-content/uploads/2023/03/facebook-logo-new-2019-freelogovectors.net_.png",height: 50,width: 50,),
                       )
                   ),


                    SizedBox(width: 10,),

                    Expanded(
                        child: Container(
                          height: 70,
                          color: Colors.grey[200],
                          child: Image.network("https://freebiehive.com/wp-content/uploads/2023/08/X-Logo.jpg",height: 50,width: 50,),
                        )
                    ),



                  ],
                ),
              ),

              SizedBox(height: 40,),


              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[500]

                  ),
                  child: Center(child: Text("Signup",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                ),
              ),

              SizedBox(height: 20,),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()),
                  );
                },
                child: Text("Dont Have Acount ? Login",style: TextStyle(fontSize: 15,color: Colors.blue)),),

          ],),
        ),
      ),
    );
  }

}