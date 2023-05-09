import 'package:app_interview/config/app_theme.dart';
import 'package:app_interview/presentation/providers/nasa_provider.dart';
import 'package:app_interview/presentation/providers/news_provider.dart';
import 'package:app_interview/presentation/screens/detail_screen.dart';
import 'package:app_interview/presentation/screens/home_screen.dart';
import 'package:app_interview/presentation/screens/initial_page.dart';
import 'package:app_interview/presentation/screens/nasa_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> NewsProvider()),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/initialPage',
        routes: {
          "/initialPage" :(context) => const InitialScreen(),
          "/home" :(context) => const HomeScreen(),
          "/detail":(context) => const DetailScreen(),
          "/nasa" :(context) => const NasaScreen(),
        },
        theme: AppTheme().theme(),
      ),
    );
  }
}