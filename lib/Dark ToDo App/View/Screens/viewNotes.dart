import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/ExplainTaskState.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/AnalysisCharts.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/FliterScreen.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/Login.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../View_Model/Utils/bloc/Note/NoteCubit.dart';
import '../../View_Model/Utils/bloc/Note/NoteStates.dart';
import '../Components/Note_Builder.dart';

import 'CreateNote.dart';

class viewNotes extends StatelessWidget {
  final bool isFilter;
  const viewNotes({super.key,required this.isFilter});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider.value(
        value: NoteCubit()..getAllNotes(isFilter: isFilter),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.filter_alt,
                    color: AppColors.whitee,
                  )),



                  IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AnalysisCharts(),
                        ));
                  },
                  icon: const Icon(
                    Icons.analytics_outlined,
                    color: AppColors.whitee,
                    size: 30,
                  )),





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
                  )),

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
                      } else {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Note_Builder(),
                            if (NoteCubit.getObject(context).dispalayMore ??
                                false)
                              BlocBuilder<NoteCubit, NoteStates>(
                                builder: (context, state) {
                                  if (state is IsLoadingPagenation) {
                                    return const My_circular_progress();
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: TextButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          39, 255, 255, 255))),
                                          onPressed: () async {
                                            await NoteCubit.getObject(context)
                                                .getAllNotesPagenation();
                                          },
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                    );
                                  }
                                },
                              ),
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
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
