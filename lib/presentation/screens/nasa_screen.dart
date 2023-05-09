import 'package:app_interview/infraestrucutre/models/nasa_model.dart';
import 'package:app_interview/presentation/providers/nasa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NasaScreen extends StatelessWidget {
  const NasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final nasap = Provider.of<NasaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Image of Nasa"),
      ),
      body: FutureBuilder(
        future: NasaProvider().getData(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              snapshot.data!.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Center(
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.copyright,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                
                                ),
                                const Spacer(),
                                Text(
                                  snapshot.data!.date.toString(),
                                  textAlign: TextAlign.center,
                                 
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              height: 300,
                              placeholder:
                                  const AssetImage("assets/loading_gif.gif"),
                              image: NetworkImage(snapshot.data!.hdurl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data!.explanation,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Text("No hay data");
        },
      ),
    );
  }
}
