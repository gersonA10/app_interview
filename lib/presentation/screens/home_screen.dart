// import 'dart:convert';

import 'package:app_interview/infraestrucutre/models/news_model.dart';
import 'package:app_interview/presentation/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<NewsProvider>(context);
    NewsProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NetForemost News",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body:  p.listResults.isEmpty ? const Center(child: CircularProgressIndicator()) : NewsCard(
        news: p.listResults,
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final List<ResultModel> news;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/detail", arguments: news[index]),
            child: SizedBox(
              width: double.infinity,
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  news[index].imageUrl.isNotEmpty
                      ? Hero(
                          tag: news[index].title,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              width: 170,
                              height: 250,
                              placeholder:
                                  const AssetImage('assets/loading_gif.gif'),
                              image: NetworkImage(news[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const FadeInImage(
                            width: 170,
                            height: 250,
                            placeholder: AssetImage('assets/loading_gif.gif'),
                            image: NetworkImage(
                              'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-hay-icono-de-imagen-vector-de-l%C3%ADnea-editable-no-hay-imagen-no-hay-foto-disponible-o-no-hay.jpg?ver=6',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          news[index].creator[0],
                          style: const TextStyle(fontSize: 15),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          news[index].country[0],
                          style:
                              const TextStyle(fontSize: 15, color: Colors.blue),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          news[index].pubDate.toString(),
                          style: const TextStyle(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        );
      },
    );
  }
}
