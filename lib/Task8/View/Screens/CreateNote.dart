import 'package:cubiterasoft/Task8/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Task8/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View/Components/timePicker.dart';
import 'package:cubiterasoft/Task8/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/Note_Model.dart';
import '../../View_Model/Utils/Utils/appColors.dart';
import '../../View_Model/Utils/bloc/Note/NoteCubit.dart';
import '../Components/NoteStatusBuilder.dart';
import '../Components/View_Full_Title_AndSub.dart';

class CreateNote extends StatelessWidget {
  NoteModel? displayNote;
  int? objectIndex;

  CreateNote.NewNote({super.key});

  CreateNote({super.key, required this.displayNote, required this.objectIndex});

  @override
  Widget build(BuildContext context) {
    if (objectIndex != null) {
      NoteCubit.getObject(context).titleCont.text = displayNote!.title;
      NoteCubit.getObject(context).subTitleCont.text = displayNote!.subTitle;
    }

    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: const myText(
          text: "Add New Task",
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
        child:BlocConsumer<NoteCubit,NoteStates>(
          builder: (context, state) {
            if(state is IsLoading){
              return const My_circular_progress();
            }else{
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
                timeFromCont: NoteCubit.getObject(context).timeFromcont,
                timeToCont: NoteCubit.getObject(context).timeTocont),
            const SizedBox(
              height: 15,
            ),
            const NoteStatusBuilder(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () async {
                    print("button clicked Save Task");
                    if (NoteCubit.getObject(context).titleCont.text != "" &&
                        NoteCubit.getObject(context).subTitleCont.text != "" &&
                        NoteCubit.getObject(context).timeFromcont.text != "" &&
                        NoteCubit.getObject(context).timeTocont.text != "") {
                      await NoteCubit.getObject(context).addNewNote();


                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const viewNotes(isFilter: false),
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
                        text: "Add Task",
                        color: AppColors.whitee,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
            }
          }, 
          listener: (BuildContext context, state) {  
            if (state is AddNewNoteSuccess) {
                    message(
                        context: context,
                        message: "New Note Added Successfully !",
                        Textcolor: Colors.green,
                        backgroundColor: AppColors.whitee
              );

                      }else if (state is GetDataFailed) {
                    message(
                        context: context,
                        message: state.error.toString(),
                        Textcolor: Colors.red);
                  }
          },
        ) 


      )),
    );
  }
}
