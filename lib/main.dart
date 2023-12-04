import 'package:cubiterasoft/Pokemon/bloc/PokemonCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/Login.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/splashScreen.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Login/LoginCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Signup/SignupCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Network/dioHelper.dart';
import 'package:cubiterasoft/Task_9/bloc/TaskCubit.dart';
import 'package:cubiterasoft/firebase_options.dart';
//import 'package:cubiterasoft/Task_6/massengerScreen.dart';
//import 'package:cubiterasoft/Task_6/welcomeScreen.dart';
import 'package:cubiterasoft/testt/bloc/Counter_bloc/Counter_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:cubiterasoft/testt/bloc/counterScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  SharedPref.init_SharedPref();
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
        BlocProvider(create: (context) => NoteCubit()..getAllNotes(isFilter: false)),
        BlocProvider(
          create: (context) => PokemonCubit()
            ..get_Pokemon_data(
              EndPoint: EndPoints.PokemonUrl,
            ),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: 
        //Login(),
        //viewNotes(isFilter: false),
        SplashScreen(),
      ),
    );
  }
}
