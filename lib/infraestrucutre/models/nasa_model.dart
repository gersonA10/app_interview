// To parse this JSON data, do
//
//     final nasa = nasaFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

NasaModel nasaFromJson(String str) => NasaModel.fromJson(json.decode(str));

String nasaToJson(NasaModel data) => json.encode(data.toJson());

class NasaModel {
    NasaModel({
        required this.copyright,
        required this.date,
        required this.explanation,
        required this.hdurl,
        required this.mediaType,
        required this.serviceVersion,
        required this.title,
        required this.url,
    });

    String copyright;
    String date;
    String explanation;
    String hdurl;
    String mediaType;
    String serviceVersion;
    String title;
    String url;

    factory NasaModel.fromJson(Map<String, dynamic> json) => NasaModel(
        copyright: json["copyright"],
        // pubDate: DateFormat.yMMMMd().format(DateTime.parse(json["pubDate"])),
        date: DateFormat.yMMMMd().format(DateTime.parse(json["date"])),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date": date,
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
    };
}
