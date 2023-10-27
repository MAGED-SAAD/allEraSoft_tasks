import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/qouteModel.dart';

class qouteScreen extends StatefulWidget {
  const qouteScreen({super.key});

  @override
  State<qouteScreen> createState() => _qouteScreenState();
}

class _qouteScreenState extends State<qouteScreen> {
  @override
  initState() {
    super.initState();
    getQouteApi();
  }

  Future<void> getQouteApi() async {
    try {
      Dio mydio = Dio();
    final Response response = await mydio.get("https://favqs.com/api/qotd");
    setState(() {});
    qouteModel.StaticQoute =
        qouteModel.fromJason(apijasonResponse: response.data);
    print(qouteModel.StaticQoute?.myqoute?.body);
    //print(myqoute.myqoute?.body);
    // print(response.data);
    
    } catch (error) {
      print(error.toString());
      
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  offset: Offset(1, 1),
                  spreadRadius: 3),
            ],
            border: Border.all(
              width: 30,
              color: AppColors.green,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myText(
              text: "،،",
              fontSize: 100,
              color: const Color.fromARGB(202, 76, 175, 79),
              fontWeight: FontWeight.bold,
            ),
            myText(
                text: "${qouteModel.StaticQoute?.myqoute?.body}",
                fontSize: 20,
                color: Colors.black),
            myText(
                text: "${qouteModel.StaticQoute?.myqoute?.author}",
                fontSize: 15,
                color: const Color.fromARGB(182, 0, 0, 0)),
          ],
        ),
      )),
    );
  }
}
