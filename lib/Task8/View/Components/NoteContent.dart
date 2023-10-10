

import 'package:cubiterasoft/Task8/View/Components/ShowTime.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';

import 'package:cubiterasoft/Task8/View_Model/Utils/appColors.dart';
import 'package:flutter/material.dart';

class NoteContent extends StatelessWidget{
  final String? title;
  final String? subtitle;
  final String? starttime;
  final String? endtime;

  const NoteContent({
    super.key,
    required this.title,
    required this.subtitle,
    this.starttime,
    this.endtime,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        myText(
            text:title??"This is the Tilte",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.whitee,
            maxliness: 1,
        ),



        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: myText(

              text: subtitle??"This is the Descreption lal aldacac vfevelfv fvefvl xfghcf hghgfhcfh hfgfhcgchcychc htxtxgfhxgf xxxxxxxxxxx dacdcacdscascvv dcvsacCVvv  svsvcdsv",
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.whitee,
              maxliness: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ),


         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShowTime(
                Iconn: Icons.watch_outlined,
                time: starttime??"20-04-2023",
              ),

              ShowTime(
                Iconn: Icons.watch_off_outlined,
                time: endtime??"20-06-2023",
              ),
          ],),
        )

      ],
    );
  }

}