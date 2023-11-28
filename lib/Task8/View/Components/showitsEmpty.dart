import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class showitsEmpty extends StatelessWidget {
  const showitsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Lottie.network(
          "https://lottie.host/491f5583-f7a3-40a6-a94d-4e54c14dc74a/byMj5hrnIo.json",
        ),
        const Center(
          child: myText(
            text: "No Data Found !",
            color: AppColors.whitee,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
