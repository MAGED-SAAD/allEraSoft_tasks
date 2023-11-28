import 'package:cubiterasoft/Task8/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Task8/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View/Components/timePicker.dart';
import 'package:cubiterasoft/Task8/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View_Model/Utils/Utils/appColors.dart';
import '../../View_Model/Utils/bloc/Note/NoteCubit.dart';
import '../Components/NoteStatusBuilder.dart';
import '../Components/View_Full_Title_AndSub.dart';

class EditNoteScreen extends StatelessWidget {
  final int? objectIndex;

  const EditNoteScreen({super.key, required this.objectIndex});

  @override
  Widget build(BuildContext context) {
    // if (objectIndex != null) {
    //   NoteCubit.getObject(context).titleCont.text = displayNote!.title;
    //   NoteCubit.getObject(context).subTitleCont.text = displayNote!.subTitle;
    // }

    return BlocProvider.value(
      value: NoteCubit()..displayOneTask(id: objectIndex!),
      child: Scaffold(
        backgroundColor: AppColors.Background,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          title: const myText(
            text: "Edit And View Note",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.whitee,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: BlocConsumer<NoteCubit, NoteStates>(
                  builder: (context, state) {
                    if (state is IsLoading) {
                      return const My_circular_progress();
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const View_Full_Title_AndSub(),
                          const SizedBox(
                            height: 15,
                          ),
                          timePicker(
                              timeFromCont:
                                  NoteCubit.getObject(context).timeFromcont,
                              timeToCont:
                                  NoteCubit.getObject(context).timeTocont),
                          const SizedBox(
                            height: 15,
                          ),
                          const NoteStatusBuilder(),
                          if (NoteCubit.getObject(context).taskImage != null)
                            Image.network(
                              NoteCubit.getObject(context).taskImage!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () async {
                                  print("button clicked Save Note");
                                  if (NoteCubit.getObject(context)
                                              .titleCont
                                              .text !=
                                          "" &&
                                      NoteCubit.getObject(context)
                                              .subTitleCont
                                              .text !=
                                          "" &&
                                      NoteCubit.getObject(context)
                                              .timeFromcont
                                              .text !=
                                          "" &&
                                      NoteCubit.getObject(context)
                                              .timeTocont
                                              .text !=
                                          "") {
                                    //edit button clicked
                                    await NoteCubit.getObject(context)
                                        .editTask(id: objectIndex!);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const viewNotes(isFilter: false,),
                                        ));
                                  } else {
                                    message(
                                        context: context,
                                        message: "Please Fill All Data",
                                        backgroundColor: Colors.red,
                                        Textcolor: AppColors.whitee);
                                  }
                                },
                                child: Ink(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: myText(
                                      text: "Edit",
                                      color: AppColors.whitee,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () async {
                                  // delete button clicked

                                  await NoteCubit.getObject(context)
                                      .deleteTask(id: objectIndex!);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const viewNotes(isFilter: false,),
                                      ));
                                },
                                child: Ink(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: myText(
                                      text: "Delete Note",
                                      color: AppColors.whitee,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is DeleteTaskSuccess) {
                      message(
                          context: context,
                          message: "Task Deleted successfuly !");
                    } else if (state is TaskEditesSuccessfuly) {
                      message(
                        context: context,
                        message: "Task Updated Successfully !",
                      );
                    } else if (state is GetDataFailed) {
                      message(
                        context: context,
                        message: state.error.toString(),
                        Textcolor: AppColors.red,
                      );
                    }
                  },
                ))),
      ),
    );
  }
}
