import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/NoteCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/Note_Model.dart';
import '../../View_Model/Utils/Utils/appColors.dart';
import '../Components/Second_Screen/View_Full_Title_AndSub.dart';

class CreateNote extends StatelessWidget {
  final NoteModel displayNote;
  final int objectIndex;
  TextEditingController titleCont = TextEditingController();
  TextEditingController subTitleCont = TextEditingController();

  CreateNote({super.key, required this.displayNote, required this.objectIndex});

  @override
  Widget build(BuildContext context) {
    titleCont.text = displayNote.title;
    subTitleCont.text = displayNote.subTitle;

    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: const myText(
          text: "Edit And View Note",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.whitee,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          View_Full_Title_AndSub(
              titleCont: titleCont, subTitleCont: subTitleCont),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  print("Done Save Note");
                  NoteCubit.getObject(context).editNote(title: titleCont.text, SubTitle: subTitleCont.text,index: objectIndex);
                },
                child: Ink(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: myText(
                      text: "Save or Edit",
                      color: AppColors.whitee,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  
                  NoteCubit.getObject(context).deleteNote(index: objectIndex);
                },
                child: Ink(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: myText(
                      text: "Delete Note",
                      color: AppColors.whitee,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
