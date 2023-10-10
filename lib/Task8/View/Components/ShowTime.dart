

import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/appColors.dart';
import 'package:flutter/material.dart';

class ShowTime extends StatelessWidget{
  final IconData Iconn;
  final String time;

  const ShowTime({
    super.key,
    required this.time,
    required this.Iconn,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whitee),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            children: [
              Icon(Iconn,color: AppColors.whitee,),
              const SizedBox(width: 8,),
              myText(text: time,color: AppColors.whitee,)
        ]),
      ),
    );
  }

}