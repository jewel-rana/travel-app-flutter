import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
import 'package:travel_app/pages/chart.dart';
import 'package:travel_app/pages/detail.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/profile.dart';
import 'package:travel_app/pages/search.dart';
import 'package:travel_app/pages/welcome.dart';
import 'package:travel_app/screens/main_screen.dart';
import 'package:travel_app/services/api_services.dart';

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
      home: BlocProvider<AppCubits> (
        create: (context) => AppCubits(
          data: ApiServices()
        ),
        child: const AppCubitLogics(),
      )
    );
  }
}