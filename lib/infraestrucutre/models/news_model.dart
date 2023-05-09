
import 'dart:convert';
import 'package:intl/intl.dart';

NewsModels newsModelsFromJson(String str) => NewsModels.fromJson(json.decode(str));

String newsModelsToJson(NewsModels data) => json.encode(data.toJson());

class NewsModels {
    NewsModels({
        required this.status,
        required this.totalResults,
        required this.results,
        required this.nextPage,
    });

    final String status;
    final int totalResults;
    final List<ResultModel> results;
    final String nextPage;

    factory NewsModels.fromJson(Map<String, dynamic> json) => NewsModels(
        status: json["status"],
        totalResults: json["totalResults"] ?? 0,
        results: List<ResultModel>.from(json["results"].map((x) => ResultModel.fromJson(x))),
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
    };
}


class ResultModel {
    ResultModel({
        required this.title,
        required this.link,
        required this.creator,
        this.videoUrl,
        required this.description,
        required this.content,
        required this.pubDate,
        required this.imageUrl,
        required this.sourceId,
        required this.country,
        required this.language,
    });

    final String title;
    final String link;
    final List<String> creator;
    final dynamic videoUrl;
    final String description;
    final String content;
    final String pubDate;
    final String imageUrl;
    final String sourceId;
    final List<String> country;
    final String language;

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        title: json["title"],
        link: json["link"],
        creator: json["creator"] != null ? List<String>.from(json["creator"].map((x) => x)) : ["SIN DATA"],
        videoUrl: json["video_url"],
        description: json["description"] ?? 'Sin descripcion',
        content: json["content"],
        //Para convertir la fecha de otra codificacion en Mes, dia y anio
        pubDate: DateFormat.yMMMMd().format(DateTime.parse(json["pubDate"])),
        imageUrl: json["image_url"] ?? '',
        sourceId: json["source_id"],
        country: List<String>.from(json["country"].map((x) => x)),
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "creator": List<dynamic>.from(creator.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate,
        "image_url": imageUrl,
        "source_id": sourceId,
        "language": language
    };



    
}
