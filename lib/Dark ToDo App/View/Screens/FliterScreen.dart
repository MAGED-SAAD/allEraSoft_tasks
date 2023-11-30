
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/NoteStatusFilterBuilder.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/timePicker.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import '../../View_Model/Utils/bloc/Note/NoteCubit.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: const myText(
          text: "Tasks Filter",
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
        child:
        Column(
          children: [
            const SizedBox(
              height: 15,
            ),

            timePicker(
                timeFromCont: NoteCubit.getObject(context).timeFromcontFilter,
                timeToCont: NoteCubit.getObject(context).timeTocontFilter,
                closrAutoValidate: true,
                ),

            const SizedBox(
              height: 15,
            ),
            
            
            const NoteStatusFilterBuilder(),


            Align(
              alignment: Alignment.centerRight ,
              child: TextButton(
                onPressed: () {
                  NoteCubit.getObject(context).NoteStatusFilterPressed(status: "null");
                  NoteCubit.getObject(context).timeFromcontFilter.text="";
                  NoteCubit.getObject(context).timeTocontFilter.text="";
                  NoteCubit.getObject(context).noteStatusFilter=null;
                },
                child:const myText(text: "Clear Filters",color: AppColors.green,fontWeight: FontWeight.w500,)),
              ),

            const Spacer(),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () async {

                    print("button clicked Filter Tasks");
                  

                    SharedPref.dateTo=NoteCubit.getObject(context).timeTocontFilter.text;
                    SharedPref.datefrom=NoteCubit.getObject(context).timeFromcontFilter.text;
                    SharedPref.status=NoteCubit.getObject(context).noteStatusFilter;


                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const viewNotes(isFilter: true,),
                          ));
                          

                  },
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: myText(
                        text: "Search Tasks",
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
        )
            


      )),
    );
    
    
  }
}
