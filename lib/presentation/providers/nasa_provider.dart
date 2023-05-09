import 'package:app_interview/infraestrucutre/models/nasa_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NasaProvider {
  final apiKey = "PDhRcu3Z4YQd6eMuIj6pqw7cqcnhsuv7euhbGB6j";

  NasaProvider() {
    print("CARGANDO LA NASA...");
    getData();
  }

  Future<NasaModel> getData() async {
    final url = "https://api.nasa.gov/planetary/apod?api_key=$apiKey";
    final res = await http.get(Uri.parse(url));
    // print(res.body);
    final nasaResponse = nasaFromJson(res.body);
    // print(nasaResponse);
    return nasaResponse;
  }
}
