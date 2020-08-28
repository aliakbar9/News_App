import 'dart:convert';

import 'package:news_app/models/ResponseNews.dart';
import 'package:http/http.dart' as http;

String apiKey = "1a586f703c6348adb37764001ff42db7";

class News {
  Future<ResponseNews> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

class NewsByCategory {
  Future<ResponseNews> getNewsByCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}
