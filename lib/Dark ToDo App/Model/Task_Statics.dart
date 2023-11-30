import 'dart:math';

class TaskStatics {
  String? name;
  int? value;

  static double maxValueDisplay = 0.0;
  int maxValue = 0;
  static int totalTasks = 0;

  static List<TaskStatics> taskStaticsList = [];

  TaskStatics({
    required this.name,
    required this.value,
  });

  TaskStatics.fromjason({required Map<String, dynamic> jsonResponse}) {
    jsonResponse.forEach((key, value) {
      taskStaticsList.add(TaskStatics(name: key, value: value));
    });

    taskStaticsList.forEach((element) {
      totalTasks += element.value!;

      if (element.value! > maxValue) {
        maxValue = element.value!;
      }

      maxValueDisplay = maxValue.toDouble();
    });
  }
}
