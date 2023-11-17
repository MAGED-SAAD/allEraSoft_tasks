import 'package:bloc/bloc.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';

import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Signup/SignupCubitStates.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupCubitStates> {
  SignupCubit() : super(InitState());

  TextEditingController namecont = TextEditingController(text: "lkbl");
  TextEditingController emailCont =
      TextEditingController(text: "amir@gamil.com");
  TextEditingController passwordCont = TextEditingController(text: "12345678");
  TextEditingController confirmpasswordCont =
      TextEditingController(text: "12345678");

  final SignupformKey = GlobalKey<FormState>();

  static SignupCubit getObject(context) {
    return (BlocProvider.of<SignupCubit>(context));
  }

  Future<void> signUp() async {
    emit(IsLoading());

    print('MMMMMMMMMMMMMMMMMMMMMMMM Api singUp Data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    await DioHelper.post(endPoint: EndPoints.signUp, data: {
      "name": namecont.text,
      "email": emailCont.text,
      "password": passwordCont.text,
      "password_confirmation": confirmpasswordCont.text
    }).then((value) {
      print(value);
      if(value?.statusCode==200) {
        emit(DataGetSuccess());
      } else {
        emit(GetDataFailed(error: "error status code ${value?.statusCode}"));
      }
      
    }).catchError((errorr) {
      emit(GetDataFailed(error: errorr.toString()));
    });
  }


}
