import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_response.dart';

class ApiControl {
//https://newsapi.org/v2/top-headlines?country=us&apiKey=c25eb5dbbf394259b47b7f1fafb67b13

  static Future<NewsResponseModel> getNewsEverything({String ? category}) async {
    String baseUrl = "newsapi.org";
    String apiKey = "c25eb5dbbf394259b47b7f1fafb67b13";

    Uri url = Uri.https(
        baseUrl, "v2/top-headlines", {
          "apiKey": apiKey,
      "country": "us",
      "category":category

        });
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);

    return NewsResponseModel.fromJson(json);
  }
}
