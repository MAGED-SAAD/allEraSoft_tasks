import 'package:cubiterasoft/Task8/View/Components/ExplainTaskState.dart';
import 'package:cubiterasoft/Task8/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Task8/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Task8/View/Screens/Login.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../View_Model/Utils/bloc/Note/NoteCubit.dart';
import '../../View_Model/Utils/bloc/Note/NoteStates.dart';
import '../Components/Note_Builder.dart';

import 'CreateNote.dart';

class viewNotes extends StatelessWidget {
  const viewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider.value(
        value: NoteCubit()..getAllNotes(),
        child: Scaffold(
          backgroundColor: AppColors.Background,
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackground,
            title: const myText(
              text: "Tasks",
              color: AppColors.whitee,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    SharedPref.clearDataAll();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.whitee,
                  ))
            ],
          ),
          floatingActionButton: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.appBarBackground,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNote.NewNote()));
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.whitee,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  const ExplainTaskState(),
                  BlocConsumer<NoteCubit, NoteStates>(
                    builder: (context, state) {
                      if (state is IsLoading) {
                        return const My_circular_progress();
                      }else{
                        return Column(
                        children: [
                          const SizedBox(height: 15,),
                          const Note_Builder(),
                          if (NoteCubit.getObject(context).dispalayMore ??false)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(39, 255, 255, 255))),
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      myText(
                                        text: "Show More ",
                                        color: AppColors.whitee,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                      Icon(
                                        Icons.arrow_downward,
                                        color: AppColors.whitee,
                                        size: 25,
                                      )
                                    ],
                                  )),
                            )
                        ],
                      );
                   
                      }
                      
                    },
                    listener: (context, state) {
                      if (state is GetDataFailed) {
                        message(
                            context: context,
                            message: state.error.toString(),
                            Textcolor: Colors.red);
                      }

                      if (state is AddNewNoteSuccess) {
                        message(
                            context: context,
                            message: "New Note Added Successfully !",
                            Textcolor: Colors.green,
                            backgroundColor: AppColors.whitee);
                      }

                      // else if (state is EditNote) {
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text(
                      //       " Note Eddited Successfully !",
                      //       style: TextStyle(
                      //           color: Color.fromARGB(60, 0, 0, 255),
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: AppColors.whitee,
                      //     showCloseIcon: true,
                      //     closeIconColor: AppColors.whitee,
                      //   ));
                      // } else if (state is DeleteNote) {
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text(
                      //       " Note Deleted  Successfully !!",
                      //       style: TextStyle(
                      //           color: AppColors.red,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: AppColors.whitee,
                      //     showCloseIcon: true,
                      //     closeIconColor: AppColors.whitee,
                      //   ));
                      // } else if (State is WrongAction) {
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text(
                      //       " This Action is Unvalid",
                      //       style: TextStyle(
                      //           color: AppColors.red,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: AppColors.whitee,
                      //     showCloseIcon: true,
                      //     closeIconColor: AppColors.whitee,
                      //   ));
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
