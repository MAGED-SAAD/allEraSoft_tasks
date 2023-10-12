import 'package:flutter/material.dart';

import '../../Model/Note_Model.dart';
import 'BackGroundNote.dart';
import 'NoteContent.dart';

class Note_card_item extends StatelessWidget {

  final void Function()? ontap;
  final NoteModel Note;
  
   Note_card_item({
    required this.Note,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BackGroundNote(
      Bordercolor:Note.borderColor??Colors.white,
      onTap: ontap,
      childd: NoteContent(
        title: Note.title,
        subtitle: Note.subTitle,
        starttime: Note.dateFrom,
        endtime: Note.dateTo,
      ),
    );
  }
}
