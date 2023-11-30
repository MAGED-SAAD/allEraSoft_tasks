import 'package:bloc/bloc.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/sharedPrefStrings.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Login/LoginCubitStates.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(InitState());

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();
  bool? m3rfsh = false;

  static LoginCubit getObject(context) {
    return (BlocProvider.of<LoginCubit>(context));
  }

  void setLocaldata({required value}) {
    SharedPref.setData(
        key: SharedStrins.Token, value: value!.data["data"]["token"]);
    SharedPref.setData(
        key: SharedStrins.UserName, value: value!.data["data"]["user"]["name"]);
    SharedPref.setData(
        key: SharedStrins.UserId, value: value!.data["data"]["user"]["id"]);
  }

  Future<void> Login() async {
    emit(IsLoading());

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api Login Data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    await DioHelper.post(endPoint: EndPoints.login, data: {
      "email": emailCont.text,
      "password": passwordCont.text,
    }).then((value) {
      print(value);

      if (value?.statusCode == 200) {
        if (m3rfsh ?? false) {
          setLocaldata(value: value);
        } else {
          DioHelper.currentToken = value!.data["data"]["token"];
        }

        emit(DataGetSuccess());
      } else {
        emit(GetDataFailed(error: "error status code ${value?.statusCode}"));
      }
    }).catchError((errorr) {
      emit(GetDataFailed(error: errorr.toString()));
    });
  }
}
