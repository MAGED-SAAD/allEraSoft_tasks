import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TaskCubitStates.dart';

class TaskCubit extends Cubit<TaskCubitStates> {
  TaskCubit() : super(InitState());

  static TaskCubit getObject(context) {
    return (BlocProvider.of<TaskCubit>(context));
  }

  int? currentSelectedIndex ;

  void itemSelected(int index) {
    if (currentSelectedIndex == index) {
      currentSelectedIndex = null;
    } else {
      currentSelectedIndex = index;
    }
    emit(SelectedIndexChange());
  }







    IconData openCloseIcon (int index) {
    if (currentSelectedIndex == index) {
      return Icons.arrow_drop_up_rounded;
    } else {
      return Icons.arrow_drop_down_rounded;
      
    }
  }

}
