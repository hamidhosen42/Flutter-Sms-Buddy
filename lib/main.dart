// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.green.withOpacity(0.5)),
        // useMaterial3: true
      ),
      home:const SplashScreen(),
    );
  }
}
