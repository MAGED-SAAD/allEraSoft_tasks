import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Note/NoteCubit.dart';
import 'package:cubiterasoft/Task_9/bloc/TaskCubit.dart';
import 'package:cubiterasoft/Task_9/bloc/TaskCubitStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Task8/View_Model/Utils/Utils/appColors.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                      child: myText(
                    text: "Hi Jim",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.power_input)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.input)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: const myText(
                    text: "You Have already spent",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.money_sharp,
                    color: AppColors.green,
                  ),
                  myText(
                    text: "\$1 123,22 ",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const myText(
                text:
                    "This approach makes it easy to create reusable  widgets with different data ",
                fontSize: 13,
                color: AppColors.appBarBackground,
              ),
              BlocConsumer<TaskCubit, TaskCubitStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 223, 223, 223)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Image.asset(
                                      "Asset/download.jpeg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(
                                      text: "Geroceries",
                                      fontSize: 13,
                                      color: AppColors.appBarBackground,
                                    ),
                                    Row(
                                      children: [
                                        myText(
                                          text: "\$21 ",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        myText(
                                          text: "/ \$400 ",
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.Background,
                                        ),
                                      ],
                                    ),
                                    myText(
                                      text: "- \$379 ",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.red,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      TaskCubit.getObject(context)
                                          .itemSelected(index);
                                    },
                                    icon: Icon(
                                      TaskCubit.getObject(context)
                                          .openCloseIcon(index),
                                      size: 40,
                                    )),
                                    const SizedBox(width: 5,)
                              ],
                            ),
                            if (index ==
                                TaskCubit.getObject(context)
                                    .currentSelectedIndex)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    myText(
                                      text: "Food Ingredients",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.icecream),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          myText(
                                            text: "Ice Cream",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Spacer(),
                                          myText(text: "-\$8.99"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.cake),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          myText(
                                            text: "Cake",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Spacer(),
                                          myText(text: "-\$5.0"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.coffee),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          myText(
                                            text: "coffee",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Spacer(),
                                          myText(text: "-\$10.0"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.local_pizza),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          myText(
                                            text: "Pizaa",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Spacer(),
                                          myText(text: "-\$15.40"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
