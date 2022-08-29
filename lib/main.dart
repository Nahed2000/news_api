import 'package:flutter/material.dart';
import 'package:news_app_with_api/view/screen/home_screen.dart';

import 'view/screen/lunch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/lunch_screen',
      routes: {
        '/lunch_screen': (context) => const LunchScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
