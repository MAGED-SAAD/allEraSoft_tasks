// ignore_for_file: prefer_null_aware_operators

import 'package:cubiterasoft/Dark%20ToDo%20App/Model/Task_Statics.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/analysisCubit/analysisCubitStates.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/EndPoints.dart';
import '../../data/Network/dioHelper.dart';

class StaticsCubit extends Cubit<AnalysisCubitStates> {
  StaticsCubit() : super(InitState());

  static StaticsCubit getObject(context) {
    return (BlocProvider.of<StaticsCubit>(context));
  }

  TaskStatics? TaskStaticsObject;

  Future<Response>? getAnalysisData() {
    TaskStatics.taskStaticsList = [];
    TaskStatics.totalTasks = 0;
    TaskStatics.maxValueDisplay = 0;

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api get Analysis Data  MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    emit(IsLoading());

    DioHelper.get(
      endPoint: EndPoints.getAnalysisDataTasks,
    ).then((value) {
      TaskStaticsObject =
          TaskStatics.fromjason(jsonResponse: value!.data["data"]);
      print(value);
      emit(DataAnalysisGetSuccess());
    }).catchError((onError) {
      emit(GetAnalysisDataFailed(error: onError.toString()));
    });
    return null;
  }
}
