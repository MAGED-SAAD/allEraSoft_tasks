// ignore_for_file: file_names, camel_case_types

import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';
import '../../Model/Note_Model.dart';
import '../Screens/CreateNote.dart';
import 'Note_card_item.dart';

class Note_Builder extends StatelessWidget {
  const Note_Builder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Notes.isEmpty?
    const Center(child: myText(text: "Empty Note ! Create One Now",color: AppColors.whitee,fontWeight: FontWeight.bold,fontSize: 20,),)
    :
    ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Notes.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        return Note_card_item(
          ontap: () {
            Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => CreateNote(displayNote: Notes[index],objectIndex: index),
              )
            );
          },
          Note: Notes[index],
        );
      },
    );
  }
}
