import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';

class NoteModel {

  Color? borderColor;
  String title;
  String subTitle;
  String dateFrom;
  String dateTo;


  NoteModel({
    required this.title,
    required this.subTitle,
    required this.dateFrom,
    required this.dateTo,
    this.borderColor=AppColors.whitee,
  });


 
}

 List <NoteModel> Notes=[
   
  ];

