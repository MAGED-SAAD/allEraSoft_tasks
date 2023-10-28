
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

        print("Edit Note cubit method");
        Notes[index].title = title;
        Notes[index].subTitle = SubTitle;
        emit(EditNote());
    
  }

  void addNote({required String title, required String subTitle}) {
    if (title == "" || subTitle == "") {
      print("Wrong Action empty text while adding new note");

      emit( WrongAction() );
      
    } else {
      Notes.add(NoteModel(
          title: title,
          subTitle: subTitle,
          dateFrom: "2023-10-7",
          dateTo: "2023-10-8"));
    }

    emit(AddNote());
  }

  void deleteNote({
    required int index,
  }) {
    if (index != null) {
      Notes.remove(Notes[index]);
      emit(DeleteNote());
    } else {
      print("Wrong Action");
      emit(WrongAction());
    }
  }
}
