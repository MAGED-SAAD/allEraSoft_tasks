import 'package:flutter/material.dart';

import '../../View_Model/Utils/Utils/appColors.dart';

class View_Full_Title_AndSub extends StatelessWidget {
  const View_Full_Title_AndSub({
    super.key,
    required this.titleCont,
    required this.subTitleCont,
  });

  final TextEditingController titleCont;
  final TextEditingController subTitleCont;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: TextFormField(
                  controller: titleCont,
                  //initialValue:displayNote.title,
                  maxLines: 1,
                  autovalidateMode:AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: AppColors.whitee),
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: AppColors.green),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.whitee,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.whitee,
                      ), //<-- SEE HERE
                    ),
                  ),

                  validator: (value) {
                    if (value == null) {
                      return ("this fieled is empty ");
                    }
                    else if(value.length<3){
                      return ("Data un Valid ");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: subTitleCont,
                  autovalidateMode:AutovalidateMode.onUserInteraction,
                  //initialValue:displayNote.title,
                  
                  
                  style: const TextStyle(color: AppColors.whitee),
                  decoration: const InputDecoration(
                    labelText: "SubTitle",
                    labelStyle: TextStyle(color: AppColors.green),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.whitee,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.whitee,
                      ), //<-- SEE HERE
                    ),
                  ),

                  validator: (value) {
                    if (value == null) {
                      return ("this fieled is empty ");
                    }
                    else if(value.length<3){
                      return ("Data is un Valid ");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
