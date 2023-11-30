// ignore_for_file: file_names, camel_case_types

import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/showitsEmpty.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/EditNote.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Note_card_item.dart';

class Note_Builder extends StatelessWidget {
  const Note_Builder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        if (state is IsLoading||NoteCubit.getObject(context).tasksModelObject==null) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.whitee,
          ));
        } else {
          if (NoteCubit.getObject(context).tasksModelObject!
              .data!
              .tasks!
              .isEmpty) {
            return const showitsEmpty();
          } else {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: NoteCubit.getObject(context)
                  .tasksModelObject!
                  .data!
                  .tasks!
                  .length,
              separatorBuilder: (context, index) {
                return  const SizedBox(
                  height: 30,
                );
              },
              itemBuilder: (context, index) {
                return Note_card_item(
                  ontap: () {

                    int? taskId = NoteCubit.getObject(context).tasksModelObject!.data!.tasks![index].id;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNoteScreen(objectIndex:taskId ),
                        ));
                  
                  },
                  Note: NoteCubit.getObject(context).tasksModelObject!.data!.tasks![index],
                );
              },
            );
          }
        }
      },
    );
  }
}
