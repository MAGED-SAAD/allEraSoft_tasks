import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/NoteStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/Note_Model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(InitState());

  static NoteCubit getObject(context) {
    return (BlocProvider.of<NoteCubit>(context));
  }

  void editNote(
      {required int index, required String title, required String SubTitle}) {
    if (index == -1) {
      if (title == "" || SubTitle == "") {
        emit(WrongAction());
        print("Wrong Action");
      } else {
        Notes.add(NoteModel(
            title: title,
            subTitle: SubTitle,
            dateFrom: "2023-10-7",
            dateTo: "2023-10-8"));
        emit(AddNote());
      }
    } else {
      Notes[index].title = title;
      Notes[index].subTitle = SubTitle;
      print(Notes);
      emit(EditNote());
    }
  }

  void addNote({required String title, required String SubTitle}) {
    if (title == "" || SubTitle == "") {
      emit(WrongAction());
      print("Wrong Action");
    } else {
      Notes.add(NoteModel(
          title: title,
          subTitle: SubTitle,
          dateFrom: "2023-10-7",
          dateTo: "2023-10-8"));
    }

    emit(AddNote());
  }

  void deleteNote({
    required int index,
  }) {
    if (index != -1) {
      Notes.remove(Notes[index]);
      emit(DeleteNote());
    } else {
      print("Wrong Action");
      emit(WrongAction());
    }
  }
}
