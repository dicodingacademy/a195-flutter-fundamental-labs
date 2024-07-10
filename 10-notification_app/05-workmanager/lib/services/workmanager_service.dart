import 'dart:math';

import 'package:notification_app/services/http_service.dart';
import 'package:notification_app/static/my_workmanager.dart';
import 'package:workmanager/workmanager.dart';

// todo-01-service-08: back to here and create a conditional task
final httpService = HttpService();

// todo-01-service-04: add initialization and we add it later
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // todo-01-service-08: back to here and create a conditional task
    if (task == MyWorkmanager.oneOff.taskName ||
        task == MyWorkmanager.oneOff.uniqueName ||
        task == Workmanager.iOSBackgroundTask) {
      print("inputData: $inputData");
    } else if (task == MyWorkmanager.periodic.taskName) {
      int randomNumber = Random().nextInt(100);
      final result = await httpService.getDataFromUrl(
          "https://jsonplaceholder.typicode.com/posts/$randomNumber");
      print("result: $result");
    }

    return Future.value(true);
  });
}

// todo-01-service-02: create a file and name it WorkmanagerService
class WorkmanagerService {
  // todo-01-service-03: add constructor
  final Workmanager _workmanager;

  WorkmanagerService([Workmanager? workmanager])
      : _workmanager = workmanager ??= Workmanager();

  // todo-01-service-04: add initialization
  Future<void> init() async {
    await _workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  }

  // todo-01-service-05: add a runOneOffTask function
  Future<void> runOneOffTask() async {
    await _workmanager.registerOneOffTask(
      MyWorkmanager.oneOff.uniqueName,
      MyWorkmanager.oneOff.taskName,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      inputData: {
        'int': 1,
        'bool': true,
        'double': 1.0,
        'string': 'string',
        'array': [1, 2, 3],
      },
    );
  }

  // todo-01-service-06: add a runPeriodicTask function
  Future<void> runPeriodicTask() async {
    await _workmanager.registerPeriodicTask(
      MyWorkmanager.periodic.uniqueName,
      MyWorkmanager.periodic.taskName,
      frequency: const Duration(minutes: 16),
      initialDelay: Duration.zero,
      inputData: {
        'int': 1,
        'bool': true,
        'double': 1.0,
        'string': 'string',
        'array': [1, 2, 3],
      },
    );
  }

  // todo-01-service-07: add a cancelAllTask function
  Future<void> cancelAllTask() async {
    await _workmanager.cancelAll();
  }
}
