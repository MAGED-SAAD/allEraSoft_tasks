import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';



class My_circular_progress extends StatelessWidget {
  const My_circular_progress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(
          color: Colors.green,
          strokeWidth: 10,
          backgroundColor: AppColors.whitee,
        ),
      ),
    );
  }
}