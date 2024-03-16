import 'package:flutter/material.dart';
import 'package:travel_app/pages/chart.dart';
import 'package:travel_app/pages/detail.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/profile.dart';
import 'package:travel_app/pages/search.dart';
import 'package:travel_app/pages/welcome.dart';
import 'package:travel_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}