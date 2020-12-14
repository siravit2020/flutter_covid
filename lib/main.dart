import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/bloc_covid/covid_bloc.dart';
import 'nav_screen.dart';


import 'bloc_covid/observer.dart';


void main() {
  Bloc.observer = FlowBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xffffddd2).withOpacity(0.2),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  BlocProvider(
    create: (BuildContext context) => VirusBloc(), child: NavScreen()),
    );
  }
}
// NavScreen()
