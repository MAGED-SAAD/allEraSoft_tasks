  import 'package:cloud_firestore/cloud_firestore.dart';

class TaskFirebaseModel {


  String? taskId;
  String? title;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? status;

  TaskFirebaseModel.fromjson({required Map<String, dynamic> map,required String taskkid}){
    taskId=taskkid;
    title=map["title"];
    description=map["description"];
    image=map["files"];
    startDate=map["start_date"];
    endDate=map["end_date"];
    status=map["status"];

  }



  } 