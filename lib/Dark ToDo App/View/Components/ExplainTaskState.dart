
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';

class ExplainTaskState extends StatelessWidget {
  const ExplainTaskState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: Row(
          children: [
            Expanded(
     flex: 2,
       child: Ink(
         padding: const EdgeInsets.all(15),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.red[700]
                 ),
         child: const Center(
             child: FittedBox(
           fit: BoxFit.scaleDown,
           child: myText(
             text: "outdated",
             color: AppColors.whitee,
             fontWeight: FontWeight.bold,
             fontSize: 15,
           ),
         )))),
            const SizedBox(
     width: 2,
            ),
            Expanded(
     flex: 2,
       child: Ink(
         padding: const EdgeInsets.all(15),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.green[700]
                 ),
         child: const Center(
             child: FittedBox(
           fit: BoxFit.scaleDown,
           child: myText(
             text: "Done",
             color: AppColors.whitee,
             fontWeight: FontWeight.bold,
             fontSize: 15,
           ),
         )))),
            const SizedBox(
     width: 2,
            ),
            Expanded(
     flex: 2,
       child: Ink(
         padding: const EdgeInsets.all(15),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.blue[700]
                     ),
         child: const Center(
             child: FittedBox(
           fit: BoxFit.scaleDown,
           child: myText(
             text: "doing",
             color: AppColors.whitee,
             fontWeight: FontWeight.bold,
             fontSize: 15,
           ),
         )))),
            const SizedBox(
     width: 2,
            ),
            Expanded(
              flex: 2,
       child: Ink(
         padding: const EdgeInsets.all(15),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: 
                  Colors.amber[700]
                 ),
         child: const Center(
             child: FittedBox(
           child: myText(
             text: "New",
             color: AppColors.whitee,
             fontWeight: FontWeight.bold,
             fontSize: 16,
           ),
         )))),
          ],
        ),
      ),
    );
  }
}
