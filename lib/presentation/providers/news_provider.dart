import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../infraestrucutre/models/news_model.dart';

String _apiKey = "apikey=pub_18599e0928443ca56e14da79d622b60bcd62b";
String _language = "language=en";
String url = "https://newsdata.io/api/1/news?$_apiKey&$_language";

class NewsProvider extends ChangeNotifier {
  List<ResultModel> listResults = [];

  NewsProvider() {
    getApi();
  }

  getApi() async {
    final response = await http.get(Uri.parse(url));

    final resp = newsModelsFromJson(const Utf8Decoder().convert(response.bodyBytes));
    // final resp = newsModelsFromJson(response.body);
    print("cargando...");
    listResults.addAll(resp.results);
    notifyListeners();
  }
}
