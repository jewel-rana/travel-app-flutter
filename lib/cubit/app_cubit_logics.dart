import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/pages/detail.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/welcome.dart';
import 'package:travel_app/screens/main_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();

}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {
            if(state is DetailState) {
              return const Detail();
            }
            if(state is WelcomeState) {
              return const Welcome(title: "Hello",);
            }
            if(state is LoadingState) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is LoadedState) {
              return const MainScreen();
            } else {
              return Container();
            }
          }
      )
    );
  }

}