import 'package:cubiterasoft/Pokemon/Model/PokemonModel.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'PokemonCubitStates.dart';

class PokemonCubit extends Cubit<PokemonCubitStates> {
  PokemonCubit() : super(InitState());

  static PokemonCubit getObject(context) {
    return (BlocProvider.of<PokemonCubit>(context));
  }

   int? currentSelectedIndex;

  // void itemSelected(int index) {
  //   if (currentSelectedIndex == index) {
  //     currentSelectedIndex = null;
  //   } else {
  //     currentSelectedIndex = index;
  //   }
  //   emit(SelectedIndexChange());
  // }

  // IconData openCloseIcon(int index) {
  //   if (currentSelectedIndex == index) {
  //     return Icons.arrow_drop_up_rounded;
  //   } else {
  //     return Icons.arrow_drop_down_rounded;
  //   }
  // }

  PokemonModel? PokemonApi;

  dynamic get_Pokemon_data({required String EndPoint}) async {
    emit(getPokemonLoading());

    print('MMMMMMMMMMMMMMMMMMMMMMMM Api get_Acc_data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    
     await DioHelper.get(endPoint: EndPoint).then((value) {
      Map<String, dynamic> valueMap = json.decode(value?.data);
      PokemonApi = PokemonModel.fromJson(json:valueMap);
      emit(getPokemonSuccess());
    }).catchError((onError) {
      emit(getPokemonFailed());
      print(onError);
    });

    //   try {
    //     final response = await myDio.post(
    //       '$baseUrl${ApiEndPoints.Acc}',
    //       data: {
    //         "pageNumber": 1,
    //         "rowsOfPage": 10,
    //         "sortingCol": null,
    //         "sortType": null,
    //         "registerRequestID": null,
    //         "patID": InPatientCubit.getObjectInpatient(context)
    //             .getInPatient[Selected_index]
    //             .patientID,
    //         "docname": null,
    //         "doctorCode": null,
    //         "datefrom": seletedDateFromcubitAcc,
    //         "dateto": seletedDateTocubitAcc
    //       },
    //     );

    //     print(
    //         'MMMMMMMMMMMMMMMMMMMMMMMM Api  get_Acc_data good MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    //     print(
    //         'response.statusCode response.statusCode ${response.statusCode.toString()}\n\n');
    //     print('response.statusCode response ${response.data.toString()}');

    //     if (response.statusCode == 200) {
    //       getAcc = [];
    //       AccModel accModel;

    //       for (var i in response.data) {
    //         accModel = AccModel.fromJson(i);
    //         getAcc.add(accModel);
    //       }
    //     } else {
    //       // Handle login failure, show error message
    //       emit(GetDataFailed());
    //       print(
    //           'MMMMMMMMMMMMMMMMMMMMMMMM Api  get_Acc_data error MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    //     }
    //     emit(DataGetSuccess());

    //     print(
    //         'MMMMMMMMMMMMMMMMMMMMMMMM Api get_Acc_data End MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    //   } catch (error) {
    //     emit(GetDataFailed(error: error.toString()));
    //     print("********get_Acc_data error***********");
    //     print("Error Details:${error.toString()}");
    //     print("********get_Acc_data error***********");
    //   }
    // }
  }
}
