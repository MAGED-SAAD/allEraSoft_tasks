import 'package:cubiterasoft/Task8/View/Components/NoteStatusBuilder.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/Note_Model.dart';
import '../../View_Model/Utils/Utils/appColors.dart';
import '../Components/View_Full_Title_AndSub.dart';

class CreateNote extends StatelessWidget {
  NoteModel? displayNote;
  int? objectIndex;
  TextEditingController titleCont = TextEditingController();
  TextEditingController subTitleCont = TextEditingController();

  CreateNote.NewNote({super.key});
  CreateNote({super.key, required this.displayNote, required this.objectIndex});

  

  @override
  Widget build(BuildContext context) {
    if (objectIndex != null) {
      titleCont.text = displayNote!.title;
      subTitleCont.text = displayNote!.subTitle;
    }

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Column(
                  children: [
          
          
            const SizedBox(
              height: 15,
            ),
            
            View_Full_Title_AndSub(
                titleCont: titleCont, subTitleCont: subTitleCont),
            const SizedBox(
              height: 15,
            ),
          
            BlocBuilder<NoteCubit,NoteStates>(
              builder: (context, state) {
                return NoteStatusBuilder();
              },
              ),
            
            
            
                 
            const Spacer(),
          
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    print("button clicked Save Note");
                    if (titleCont.text != "" && subTitleCont.text != "") {
                      if (objectIndex != null) {
                        Navigator.pop(context);
                        NoteCubit.getObject(context).editNote(
                            title: titleCont.text,
                            SubTitle: subTitleCont.text,
                            index: objectIndex!);
                      } else {
                        Navigator.pop(context);
                        NoteCubit.getObject(context).addNote(
                            title: titleCont.text, subTitle: subTitleCont.text);
                      }
                    }
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    if (objectIndex != null) {
                      Navigator.pop(context);
                      NoteCubit.getObject(context)
                          .deleteNote(index: objectIndex!);
                    }
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
                ),
          )),
    );
  }
}
