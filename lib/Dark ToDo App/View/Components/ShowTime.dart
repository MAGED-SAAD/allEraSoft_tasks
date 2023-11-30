import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';

class ShowTime extends StatelessWidget {
  final IconData Iconn;
  final String time;
  final Color color;

  const ShowTime({
    super.key,
    required this.time,
    required this.Iconn,
    required this.color
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
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
            Icon(
              Iconn,
              color: color,
            ),
            const SizedBox(
              width: 8,
            ),
            myText(
              text: time,
              color: AppColors.whitee,
            )
          ]),
        ),
      ),
    );
  }
}
