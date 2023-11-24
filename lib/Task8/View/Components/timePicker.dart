import 'package:flutter/material.dart';

import '../../View_Model/Utils/Utils/appColors.dart';

class timePicker extends StatelessWidget {
  const timePicker({
    super.key,
    required this.timeFromCont,
    required this.timeToCont,
  });

  final TextEditingController timeFromCont;
  final TextEditingController timeToCont;

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
                  controller: timeFromCont,
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    ).then((value) {
                      if (value != null) {
                        timeFromCont.text = value.toString().substring(0,10);
                      }
                    });
                  },
                  readOnly: true,
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: AppColors.whitee),
                  decoration: const InputDecoration(
                    labelText: "From Date",
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
                    } else if (value.length < 3) {
                      return ("Data un Valid ");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: timeToCont,
                  onTap: () async{
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    ).then((value) {
                      if (value != null) {
                        timeToCont.text = value.toString().substring(0,10);
                      }
                    });

                  },
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  //initialValue:displayNote.title,

                  style: const TextStyle(color: AppColors.whitee),
                  decoration: const InputDecoration(
                    labelText: "To Date ",
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
                    } else if (value.length < 3) {
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
