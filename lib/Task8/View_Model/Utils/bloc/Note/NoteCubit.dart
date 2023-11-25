import 'package:bloc/bloc.dart';
import 'package:cubiterasoft/Task8/Model/tasksModel.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/sharedPrefStrings.dart';

import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Local/SharedPref.dart';

import 'package:cubiterasoft/Task8/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Model/Note_Model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(InitState());

  final TextEditingController timeFromcont = TextEditingController();
  final TextEditingController timeTocont = TextEditingController();
  TextEditingController titleCont = TextEditingController();
  TextEditingController subTitleCont = TextEditingController();

  String? noteStatus;

  static NoteCubit getObject(context) {
    return (BlocProvider.of<NoteCubit>(context));
  }

  TasksModel? tasksModelObject;

  bool? dispalayMore = false;
  int currentPageNum = 1;

  Future<Response>? getAllNotes() {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api Get All Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    emit(IsLoading());

    DioHelper.get(
      endPoint: EndPoints.getAlltasks,
      // Token: SharedPref.getData(key: SharedStrins.Token),
    ).then((value) {
      tasksModelObject = TasksModel.fromJson(value?.data);
      if (tasksModelObject!.data!.meta!.currentPage !=
          tasksModelObject!.data!.meta!.lastPage) {
        dispalayMore = true;
      }

      print(value);
      emit(DataGetSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
    return null;
  }

  Color taskColor({required String Status}) {
    if (Status == "outdated") {
      return Colors.red;
    } else if (Status == "compeleted") {
      return Colors.green;
    } else if (Status == "doing") {
      return Colors.blue;
    } else {
      return Colors.yellow;
    }
  }

  Future<void> addNewNote() async {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api Add New  Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    emit(IsLoading());

    await DioHelper.post(
      data: {
        'files': "null",
        'title': titleCont.text,
        'description': subTitleCont.text,
        'start_date': timeFromcont.text.toString().substring(0, 10),
        'end_date': timeTocont.text.toString().substring(0, 10),
        'status': noteStatus,
      },
      headers: {"Authorization": "Bearer ${DioHelper.currentToken}"},
      endPoint: EndPoints.addNewNote,
      // Token: SharedPref.getData(key: SharedStrins.Token),
    ).then((value) {
      print(value);
      emit(AddNewNoteSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
  }

  // ignore: non_constant_identifier_names
  void NoteStatusPressed({required String status}) {
    if (noteStatus == status) {
    } else {
      noteStatus = status;
      emit(ChangeNoteStatus());
    }
  }

  Tasks? objectOfOneTask;

  Future<void> displayOneTask({required int id}) async {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api displayOneTask  MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    emit(IsLoading());

    await DioHelper.get(
      endPoint: "${EndPoints.getAlltasks}/$id",
    ).then((value) {
      objectOfOneTask = Tasks.fromJson(value!.data["data"]);
      fillDataOfTask();
      print(value);
      emit(DisplayOneTaskSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
  }

  String? taskImage;

  void fillDataOfTask() {
    if (objectOfOneTask == null) print("its null");
    timeFromcont.text = objectOfOneTask!.startDate ?? "";
    timeTocont.text = objectOfOneTask!.endDate ?? "";
    titleCont.text = objectOfOneTask!.title ?? "";
    subTitleCont.text = objectOfOneTask!.description ?? "";
    noteStatus = objectOfOneTask!.status ?? "";
    taskImage = objectOfOneTask!.image;
  }

  Future<void> deleteTask({required int id}) async {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api deleteTask  MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    emit(IsLoading());

    await DioHelper.deletee(
      endPoint: "${EndPoints.getAlltasks}/$id",
    ).then((value) {
      print(value);
      emit(DeleteTaskSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
  }

  Future<void> editTask({required int id}) async {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api edit Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    emit(IsLoading());

    await DioHelper.post(
      data: {
        '_method': 'PUT',
        'title': titleCont.text,
        'description': subTitleCont.text,
        'start_date': timeFromcont.text.toString().substring(0, 10),
        'end_date': timeTocont.text.toString().substring(0, 10),
        'status': noteStatus,
      },
      headers: {"Authorization": "Bearer ${DioHelper.currentToken}"},
      endPoint: "${EndPoints.getAlltasks}/$id",
      // Token: SharedPref.getData(key: SharedStrins.Token),
    ).then((value) {
      print(value);
      emit(TaskEditesSuccessfuly());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
  }

  Future<Response>? getAllNotesPagenation() {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api  getAllTasksPagenation Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    emit(IsLoading());

    DioHelper.get(
      endPoint: "${EndPoints.getAlltasks}?page=${++currentPageNum}",
      // Token: SharedPref.getData(key: SharedStrins.Token),
    ).then((value) {
      tasksModelObject = TasksModel.fromJson(value?.data);
      if (tasksModelObject!.data!.meta!.currentPage !=
          tasksModelObject!.data!.meta!.lastPage) {
        dispalayMore = true;
      }

      print(value);
      emit(DataGetSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
    return null;
  }
}
