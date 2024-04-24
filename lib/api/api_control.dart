import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiControl {

  static Future<NewsResponseModel> getNewsEverything({String ? category}) async {
    String baseUrl = "newsapi.org";
    String apiKey = dotenv.env["Api_Key"]??"";

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
