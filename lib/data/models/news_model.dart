
class NewsModel{
  String? status;
  int? totalResults;
  List <dynamic>? articles;

  NewsModel.fromjson(Map<String, dynamic>? json){
    status =json?["status"];
    totalResults =json?["totalResults"];
    articles =json?["articles"].map((e)=> Article.fromjson(e)).toList();
  }
}

class Article{
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;
  Article.fromjson(Map<String, dynamic>? json){
    title = json?["title"];
    description = json?["description"];
    url = json?["url"];
    urlToImage = json?["urlToImage"];
    publishedAt = json?["publishedAt"];
    content = json?["content"];
    source = Source.fromjson(json?["source"]);
  }
}

class Source{
  String? id;
  String? name;
  Source.fromjson(Map<String, dynamic>? json){
    id = json?["id"];
    name = json?["name"];
  }
}