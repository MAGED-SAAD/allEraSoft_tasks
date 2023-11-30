import 'package:cubiterasoft/Dark%20ToDo%20App/Model/tasksModel.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:flutter/material.dart';

import 'BackGroundNote.dart';
import 'NoteContent.dart';

class Note_card_item extends StatelessWidget {

  final void Function()? ontap;
  final Tasks Note;
  
   Note_card_item({
    required this.Note,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BackGroundNote(
      Bordercolor:NoteCubit.getObject(context).taskColor(
        Status: Note.status??"New"
        ),
      onTap: ontap,
      childd: NoteContent(
        title: Note.title,
        subtitle: Note.title,
        starttime: Note.startDate,
        endtime: Note.endDate,
      ),
    );
  }
}
