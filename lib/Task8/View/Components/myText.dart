

import 'package:flutter/material.dart';

class myText extends StatelessWidget{
  final String text;
  final double ?fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow ;
  final int? maxliness;
  final double? letterSpacing;

   const myText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textOverflow,
    this.maxliness,
    this.letterSpacing,
});

  @override
  Widget build(BuildContext context) {

    return Text(
        text,
      overflow: textOverflow,
      maxLines:maxliness ,
      style: TextStyle(
        color: color,
        fontSize:fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        

      ),
    );
  }

}