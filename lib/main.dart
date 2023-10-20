import 'package:flutter/material.dart';

import 'screens/favourite_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //routes list
  static Map<String, WidgetBuilder> appRoutes = {
    '/': (context) => const HomeScreen(),
    '/favorite': (context) => const FavoriteScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMT Tech Flutter Coding Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: appRoutes,
    );
  }
}
