import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/Login.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/sharedPrefStrings.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:cubiterasoft/Task_6/gridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../View_Model/Utils/Utils/appColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (SharedPref.getData(key: SharedStrins.UserId) != null &&SharedPref.getData(key: SharedStrins.time)==DateTime.now().hour) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const viewNotes(
                  isFilter: false,
                ),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: LottieBuilder.network(
          "https://lottie.host/ab7f2dc4-825b-46c7-8cb1-fbe5a407ebe4/hm4eQ3cJBl.json",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      )),
    );
  }
}
