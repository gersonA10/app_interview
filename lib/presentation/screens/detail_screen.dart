import 'package:app_interview/infraestrucutre/models/news_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultModel arguments =
        ModalRoute.of(context)!.settings.arguments as ResultModel;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.277,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: arguments.title,
              child: FadeInImage(
                placeholder: const AssetImage("assets/loading_gif.gif"),
                image: arguments.imageUrl.isNotEmpty
                    ? NetworkImage(arguments.imageUrl)
                    : const NetworkImage(
                        'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-hay-icono-de-imagen-vector-de-l%C3%ADnea-editable-no-hay-imagen-no-hay-foto-disponible-o-no-hay.jpg?ver=6',
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      arguments.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(child: Text(arguments.creator[0], maxLines: 2,)),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            arguments.pubDate,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        arguments.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
