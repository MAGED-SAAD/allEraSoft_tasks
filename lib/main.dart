

import 'package:cubiterasoft/Task8/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/NoteCubit.dart';
import 'package:cubiterasoft/Task_9/bloc/TaskCubit.dart';
//import 'package:cubiterasoft/Task_6/massengerScreen.dart';
//import 'package:cubiterasoft/Task_6/welcomeScreen.dart';
import 'package:cubiterasoft/testt/bloc/Counter_bloc/Counter_cubit.dart';
//import 'package:cubiterasoft/testt/bloc/counterScreen.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'Task_9/View/TaskScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => Counter_cubit()),
        BlocProvider(create: (context)=>NoteCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:TaskScreen(),
        //gridViewScreen(),
      ),
    );
  }
}
