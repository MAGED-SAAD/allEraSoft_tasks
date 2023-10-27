class qouteModel {
  static qouteModel? StaticQoute;
  String? qouteDate;
  qoute? myqoute;

  qouteModel.fromJason({required Map<String, dynamic> apijasonResponse}) {
    qouteDate = apijasonResponse["qotd_date"];
    myqoute = qoute.formjason(apijasonResponse: apijasonResponse["quote"]);
  }
}

class qoute {
  int? id;
  bool? dialogue;
  bool? private;
  List<String>? tags;
  String? url;
  int? favoritesCount;
  int? upvotesCount;
  int? downvotesCount;
  String? author;
  String? authorPermalink;
  String? body;

  qoute.formjason({required Map<String, dynamic> apijasonResponse}) {
    id = apijasonResponse["id"];

    dialogue = apijasonResponse['dialogue'];
    private = apijasonResponse['private'];
    tags = apijasonResponse['tags'].cast<String>();
    url = apijasonResponse['url'];
    favoritesCount = apijasonResponse['favorites_count'];
    upvotesCount = apijasonResponse['upvotes_count'];
    downvotesCount = apijasonResponse['downvotes_count'];
    author = apijasonResponse['author'];
    authorPermalink = apijasonResponse['author_permalink'];
    body = apijasonResponse['body'];
  }
}
