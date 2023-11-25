// ignore_for_file: file_names

class TasksModel {
  Data? data;
  String? message;
  int? status;

  
  TasksModel.fromJson(dynamic json) {
    //print(json);

    data = json["data"] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];

    status = json['status'];
  }
}

class Data {
  List<Tasks>? tasks;
  Meta? meta;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];

      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }

    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Tasks {

  int? id;
  String? title;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? status;

  Tasks.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }
}

class Meta {
  int? total;
  int? perPage;
  
  int? currentPage;
  int? lastPage;

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
}


















/*
// ignore_for_file: file_names


class TasksModel {

  Data? data;
  String? message;
  int? status;

  //TasksModel({this.data, this.message,  this.status});

  TasksModel.fromJson( Map<String, dynamic> json ) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];

    status = json['status'];
  }
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
*/
}

class Data {
  List<Tasks>? tasks;
  Meta? meta;
  //Links? links;
  //List<String>? pages;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    //links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    //pages = json['pages'].cast<String>();
  }
/* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    /*
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }*/

    data['pages'] = this.pages;
    return data;
  }
  */
}

class Tasks {
  int? id;
  String? title;
  String? description;
  Null? image;
  String? startDate;
  String? endDate;
  String? status;

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    return data;
  }

  */
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    return data;
  }
  */
}





/*
class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}
*/
*/