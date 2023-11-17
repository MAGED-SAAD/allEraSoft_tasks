

import 'package:cubiterasoft/Pokemon/Screen/PokemonGridView.dart';
import 'package:cubiterasoft/Pokemon/bloc/PokemonCubit.dart';
import 'package:cubiterasoft/Task8/Model/Note_Model.dart';
import 'package:cubiterasoft/Task8/View/Screens/Login.dart';
import 'package:cubiterasoft/Task8/View/Screens/Signup.dart';
import 'package:cubiterasoft/Task8/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Login/LoginCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Signup/SignupCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:cubiterasoft/Task_9/bloc/TaskCubit.dart';
//import 'package:cubiterasoft/Task_6/massengerScreen.dart';
//import 'package:cubiterasoft/Task_6/welcomeScreen.dart';
import 'package:cubiterasoft/testt/bloc/Counter_bloc/Counter_cubit.dart';

//import 'package:cubiterasoft/testt/bloc/counterScreen.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'Task_10/View/qouteScreen.dart';
import 'Task_9/View/TaskScreen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init_SharedPref;
  DioHelper.init();
  runApp(const MyApp());
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => Counter_cubit()),
        BlocProvider(create: (context)=>NoteCubit()),
        BlocProvider(create: (context)=>PokemonCubit()..get_Pokemon_data(EndPoint: EndPoints.PokemonUrl,),)
      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Login(),
        //gridViewScreen(),
      ),
    );
  }
}
