import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:flutter/material.dart';

void message({required BuildContext context, required String message,Color? backgroundColor,Color? Textcolor }) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Textcolor??Colors.green, fontWeight: FontWeight.bold),
    ),
    //"This Email didn't Sign up Yet"),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor??AppColors.whitee,
    showCloseIcon: true,
    padding: const EdgeInsets.all(10),
    closeIconColor: AppColors.whitee,
  ));
}
