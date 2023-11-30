import 'package:cubiterasoft/Dark%20ToDo%20App/Model/Task_Statics.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/analysisCubit/analysisCubitStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../View_Model/Utils/bloc/analysisCubit/StaticsCubit.dart';

class AnalysisCharts extends StatelessWidget {

 
  
  AnalysisCharts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider.value(
      value:StaticsCubit()..getAnalysisData(),
      child: Scaffold(
          backgroundColor: AppColors.Background,
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackground,
            title: const myText(
              text: "Analysis Charts",
              color: AppColors.whitee,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: BlocBuilder <StaticsCubit,AnalysisCubitStates>(
                builder: (context, state) {
              if (state is IsLoading) {
                return const My_circular_progress();
              } else {
                return Column(
                  children: [

                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: myText(
                          text: "Total Tasks: ${TaskStatics.totalTasks}",
                          color: AppColors.whitee,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          
                          ),
                      ),
                    ),
                    SfCircularChart(
                      borderColor: Colors.white,
                      borderWidth: 2,
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        opacity: 0.5,
                        duration: 3,
                        
                      ),
                      legend: const Legend(
                        isVisible: true,
    
                        textStyle: TextStyle(color: Colors.white),
                        iconHeight: 22,
                        iconWidth: 22,
    
                        //iconBorderColor: ,
                        borderWidth: 3,
    
                        opacity: 1,
                      ),
                      series: <CircularSeries>[
                        RadialBarSeries<TaskStatics, String>(
                            dataSource: TaskStatics.taskStaticsList,
                            xValueMapper: (TaskStatics task, index) => task.name,
                            yValueMapper: (TaskStatics task, index) =>task.value,
                            maximumValue:TaskStatics.maxValueDisplay+1,
                            innerRadius: "8",

                            selectionBehavior: SelectionBehavior(
                              
                              enable: true,
                              selectedColor: Colors.amber,
                              unselectedColor: AppColors.Background,
                            ),
                            dataLabelSettings: const DataLabelSettings(
                              // labelPosition: ChartDataLabelPosition.inside,
                              // labelAlignment: ChartDataLabelAlignment.top,
                              //margin: EdgeInsets.all(40),
                              opacity: 0,
                              overflowMode: OverflowMode.shift,
                              
                              borderColor: Colors.black,
                              borderRadius: 2,
                              borderWidth: 2,
                              color: Colors.white,
                              isVisible: true,
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),



                    
                    SfCircularChart(
                      borderColor: Colors.white,
                      borderWidth: 2,
                      tooltipBehavior: TooltipBehavior(
                          enable: true, opacity: 0.5, duration: 3),
                      legend: const Legend(
                        iconBorderWidth: 2,
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                        textStyle: TextStyle(color: Colors.white),
                        iconHeight: 20,
                        iconWidth: 20,
                      ),
                      series: <CircularSeries>[
                        PieSeries<TaskStatics, String>(
                            dataSource: TaskStatics.taskStaticsList,
                            xValueMapper: (TaskStatics task, index) => task.name,
                            yValueMapper: (TaskStatics task, index) =>
                                task.value,
                            startAngle: 90,
                            endAngle: 90,
                            explode: true,
                            explodeIndex: 0,
                            explodeOffset: '10%',
                            dataLabelSettings: const DataLabelSettings(
                              color: Colors.white,
                              isVisible: true,
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ],
                    ),
                  ],
                );
              }
            }),
          ))),
    );
  }
}

// List<Task_Statics> getChartData() {
//   List<Task_Statics> myChartList = [
//     Task_Statics(name: "New", value: 2),
//     Task_Statics(name: "Doing", value: 3),
//     Task_Statics(name: "Compeleted", value: 6),
//     Task_Statics(name: "out dated", value: 4),
//   ];

//   return myChartList;
// }

// class Task_Statics {
//   final String name;
//   final int value;

//   Task_Statics({
//     required this.name,
//     required this.value,
//   });
// }
