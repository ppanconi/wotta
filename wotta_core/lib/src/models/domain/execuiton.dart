

import 'package:built_value/built_value.dart';
import 'package:wotta_core/wotta_core.dart';

abstract class Executor {

  Execution get execution;

  ExecutionItem get currentExecutionItem;

}

abstract class Execution {
  String title;
  List<ExecutionItem> items;
}

abstract class ExecutionItem {

  String get title;
  String get subTitle;
  @nullable
  String get notes;

  bool get manualStop;
  bool get rest;

  @nullable
  int durationSecs;

  List<int> get startWorkTimestampsSec;
  List<int> get stopWorkTimestampsSec;

}


abstract class WorkoutExecuiton {

  Workout get workout;
  WorkoutDefinition get definition;


}

abstract class WorkoutExecutionItem {


  @nullable
  ActivityDefinitionSequenceItem get activitySequenceItem;

  @nullable
  ActivityWork get activityWork;

}