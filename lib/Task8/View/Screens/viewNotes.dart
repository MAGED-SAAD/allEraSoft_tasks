
import 'package:cubiterasoft/Task8/View/Components/BackGroundNote.dart';
import 'package:cubiterasoft/Task8/View/Components/NoteContent.dart';
import 'package:flutter/material.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/appColors.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';

class viewNotes extends StatelessWidget{

  const viewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(

        backgroundColor:AppColors.appBarBackground,
        title: myText(
          text: "Note App",
          color: AppColors.whitee,
          fontWeight: FontWeight.bold,
        ),
        centerTitle:true,
      ),
      floatingActionButton:IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.add),
      ) ,


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          children: [

            BackGroundNote(
              onTap: () {

              },
              Bordercolor: AppColors.whitee,
              childd:  const NoteContent(
                  title: null,
                  subtitle:null,
                  starttime:null ,
                  endtime:null ,
              ),
            ),
        ],),
      ),
    );
  }

}