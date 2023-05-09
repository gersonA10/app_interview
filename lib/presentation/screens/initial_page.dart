import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Practice App"),
        ),
        body: Column(
          children: [
            ListScreens(
              icon: Icons.newspaper,
              route: () => Navigator.pushNamed(context, '/home'),
              title: "Noticias Api",
            ),
            ListScreens(
              icon: Icons.travel_explore_outlined,
              route: () => Navigator.pushNamed(context, "/nasa"),
              title: "Nasa Api",
            ),
          ],
        ));
  }
}

class ListScreens extends StatelessWidget {
  final String title;
  final VoidCallback route;
  final IconData icon;
  const ListScreens({
    required this.title,
    super.key,
    required this.route, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(icon),
      trailing: IconButton(
        onPressed: route,
        icon: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
