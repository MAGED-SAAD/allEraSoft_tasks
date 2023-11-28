

import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteStatusFilterBuilder extends StatelessWidget {
  const NoteStatusFilterBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        return  
        Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3, color: AppColors.lite_white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  NoteCubit.getObject(context).NoteStatusFilterPressed(status: "outdated");
                },
                borderRadius: BorderRadius.circular(15),
                splashColor: AppColors.lite_white,
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: NoteCubit.getObject(context).noteStatusFilter ==
                                "outdated"
                            ? Colors.red[700]
                            : null),
                    child: const Center(
                        child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: myText(
                        text: "outdated",
                        color: AppColors.whitee,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))),
              )),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  NoteCubit.getObject(context)
                      .NoteStatusFilterPressed(status: "compeleted");
                },
                borderRadius: BorderRadius.circular(15),
                splashColor: AppColors.lite_white,
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: NoteCubit.getObject(context).noteStatusFilter ==
                                "compeleted"
                            ? Colors.green[700]
                            : null),
                    child: const Center(
                        child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: myText(
                        text: "compeleted",
                        color: AppColors.whitee,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))),
              )),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  NoteCubit.getObject(context)
                      .NoteStatusFilterPressed(status: "doing");
                },
                borderRadius: BorderRadius.circular(15),
                splashColor: AppColors.lite_white,
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            NoteCubit.getObject(context).noteStatusFilter == "doing"
                                ? Colors.blue[700]
                                : null),
                    child: const Center(
                        child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: myText(
                        text: "doing",
                        color: AppColors.whitee,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))),
              )),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  NoteCubit.getObject(context).NoteStatusFilterPressed(status: "new");
                },
                borderRadius: BorderRadius.circular(15),
                splashColor: AppColors.lite_white,
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: NoteCubit.getObject(context).noteStatusFilter == "new"
                            ? Colors.amber[700]
                            : null),
                    child: const Center(
                        child: FittedBox(
                      child: myText(
                        text: "new",
                        color: AppColors.whitee,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))),
              )),
            ],
          ),
        ),
      ),
    );
  
      },
    );
   
  }
}
