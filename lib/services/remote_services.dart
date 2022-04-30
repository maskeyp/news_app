import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=aaee0cfb46914ac886540a8537e99b0f");

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];

    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    // ignore: avoid_print
    print(_articalsList);

    return newsList;
  } else {
    // ignore: avoid_print
    print("error");
    return [];
  }
}










// import 'dart:convert';

// import '../models/post.dart';
// import 'package:http/http.dart' as http;

// class RemoteService {
//   Future<List<Article>> getArticle() async {
//     var client = http.Client();
//     var uri = Uri.parse(
//         'https://newsapi.org/v2/everything?q=bitcoin&apiKey=aaee0cfb46914ac886540a8537e99b0f');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> json = jsonDecode(response.body);
//       List<dynamic> body = json['articles'];
//       List<Article> articles =
//           body.map((dynamic item) => Article.fromJson(item)).toList();

//       return articles;
//     } else {
//       throw ("Error");
//     }
//   }
// }
