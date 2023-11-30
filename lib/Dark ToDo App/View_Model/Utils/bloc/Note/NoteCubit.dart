// ignore_for_file: prefer_null_aware_operators

import 'package:bloc/bloc.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/Model/tasksModel.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/sharedPrefStrings.dart';

import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';

import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Model/Note_Model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(InitState());

  final TextEditingController timeFromcontFilter = TextEditingController();
  final TextEditingController timeTocontFilter = TextEditingController();
  String? noteStatusFilter;

  final TextEditingController timeFromcont = TextEditingController();
  final TextEditingController timeTocont = TextEditingController();

  final TextEditingController titleCont = TextEditingController();
  final TextEditingController subTitleCont = TextEditingController();

  String? noteStatus;

  static NoteCubit getObject(context) {
    return (BlocProvider.of<NoteCubit>(context));
  }

  TasksModel? tasksModelObject;

  bool? dispalayMore = false;
  int currentPageNum = 1;



  Future<Response>? getAllNotes({required bool isFilter}) {
    print('MMMMMMMMMMMMMMMMMMMMMMMM Api Get All Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    emit(IsLoading());

    print(SharedPref.dateTo);
    print(SharedPref.status);

    DioHelper.get(endPoint: 
    isFilter?
    EndPoints.getFilterTasks
    :
    EndPoints.getAlltasks, 
   
   
    Prams: {
      "to": SharedPref.dateTo == null||SharedPref.dateTo == ""
          ? null
          : SharedPref.dateTo.toString().substring(0, 10),
      "from": SharedPref.datefrom == null||SharedPref.datefrom == ""
          ? null
          : SharedPref.datefrom.toString().substring(0, 10),
      "status": SharedPref.status,
    }
    
    
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
    print('MMMMMMMMMMMMMMMMMMMMMMMM Api Add New  Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

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

  void NoteStatusFilterPressed({required String status}) {
    if (noteStatusFilter == status) {
    } else {
      noteStatusFilter = status;
      emit(ChangeNoteStatusFilter());
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

  TasksModel? tasksModelObjectPagenation;

  Future<Response>? getAllNotesPagenation() {
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api  getAllTasksPagenation Tasks MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    emit(IsLoadingPagenation());

    DioHelper.get(
      endPoint: "${EndPoints.getAlltasks}?page=${++currentPageNum}",
      // Token: SharedPref.getData(key: SharedStrins.Token),
    ).then((value) {
      tasksModelObjectPagenation = TasksModel.fromJson(value?.data);

      tasksModelObjectPagenation!.data!.tasks!.forEach((element) {
        tasksModelObject!.data!.tasks!.add(element);
      });

      if (tasksModelObjectPagenation!.data!.meta!.currentPage! <
          tasksModelObjectPagenation!.data!.meta!.lastPage!) {
        dispalayMore = true;
      } else {
        dispalayMore = false;
      }

      print(value);
      emit(PagenationDataGetSuccess());
    }).catchError((onError) {
      emit(GetDataFailed(error: onError.toString()));
    });
    return null;
  }
}
