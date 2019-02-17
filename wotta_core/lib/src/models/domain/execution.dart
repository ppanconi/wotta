library execution;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:wotta_core/wotta_core.dart';

part 'execution.g.dart';

abstract class Executor implements Built<Executor, ExecutorBuilder> {

  static Serializer<Executor> get serializer => _$executorSerializer;

  Executor._();
  factory Executor([void updates(ExecutorBuilder b)]) = _$Executor;

  Execution get execution;

  ExecutionItem get currentExecutionItem;

  bool get isPaused;


}

abstract class Execution {
  String get title;
  List<ExecutionItem> get items;

  @override
  String toString() {
    return 'Execution{'
          '\ttitle=$title,\n'
          '\titems=[\n'
          '\t\t${items.map( (i) => i.toString()).join(',\n\t\t') }],\n'
          '\t'
        '}';
  }


}

abstract class ExecutionItem {

  String get title;
  String get subTitle;
  @nullable
  String get notes;

  bool get manualStop;
  bool get isRest;

  @nullable
  int get durationSecs;

  List<int> get startWorkTimestampsSec;
  List<int> get stopWorkTimestampsSec;

  @override
  String toString() {
    return 'ExecutionItem{\n'
            '\t\t\ttitle=$title,\n'
            '\t\t\tsubTitle=$subTitle,\n'
            '\t\t\tnotes=$notes,\n'
            '\t\t\tmanualStop=$manualStop,\n'
            '\t\t\tisRest=$isRest,\n'
            '\t\t\tdurationSecs=$durationSecs,\n'
        '\t\t}';
  }


}

class WorkoutExecution extends Execution with _WorkoutExecutionMixin {
  InnerWorkoutExecution innerWorkoutExecution;

  WorkoutExecution(this.innerWorkoutExecution);
}

abstract class _WorkoutExecutionMixin {
  InnerWorkoutExecution innerWorkoutExecution;

  String get title {
    return innerWorkoutExecution.workout.title;
  }
  List<ExecutionItem> get items {
    return innerWorkoutExecution.executionItems.map((i) => WorkoutExecutionItem(i)).toList();
  }


}


abstract class InnerWorkoutExecution
    implements Built<InnerWorkoutExecution, InnerWorkoutExecutionBuilder> {

  static Serializer<InnerWorkoutExecution> get serializer => _$innerWorkoutExecutionSerializer;


  Workout get workout;
  WorkoutDefinition get definition;
  BuiltList<InnerWorkoutExecutionItem> get executionItems;

  InnerWorkoutExecution._();

  factory InnerWorkoutExecution([void updates(InnerWorkoutExecutionBuilder b)]) = _$InnerWorkoutExecution;
}

class WorkoutExecutionItem extends ExecutionItem with _WorkoutExecutionItemMixin {
  InnerWorkoutExecutionItem innerWorkoutExecutionItem;
  WorkoutExecutionItem(this.innerWorkoutExecutionItem);
}

abstract class InnerWorkoutExecutionItem
    implements Built<InnerWorkoutExecutionItem, InnerWorkoutExecutionItemBuilder> {

  static Serializer<InnerWorkoutExecutionItem> get serializer => _$innerWorkoutExecutionItemSerializer;


  @nullable
  ActivityDefinitionSequenceItem get activitySequenceItem;

  @nullable
  ActivityWork get activityWork;

  WorkoutExecutionItemType get type;

  BuiltList<int> get startWorkTimestampsSec;
  BuiltList<int> get stopWorkTimestampsSec;

  InnerWorkoutExecutionItem._();

  factory InnerWorkoutExecutionItem([void updates(InnerWorkoutExecutionItemBuilder b)]) = _$InnerWorkoutExecutionItem;

}

abstract class _WorkoutExecutionItemMixin {
  InnerWorkoutExecutionItem innerWorkoutExecutionItem;

  String get title {
    if (innerWorkoutExecutionItem.activitySequenceItem != null) {
      return innerWorkoutExecutionItem.activitySequenceItem.activityDefinition.name;
    } else {
      if (innerWorkoutExecutionItem.type == WorkoutExecutionItemType.WARMUP) {
        return 'Warmup';
      } else {
      return 'Cooldown';
      }
    }
  }

  String get subTitle {
    if (innerWorkoutExecutionItem.activitySequenceItem == null) {
      return '';
    } else {
      if (innerWorkoutExecutionItem.activityWork == null) {
        return '${title} post rest';
      } else {
        var rest = isRest ? ' rest' : '';
        var workIndex = innerWorkoutExecutionItem.activitySequenceItem
          .activityDefinition.activityWorkSequence.indexOf(innerWorkoutExecutionItem.activityWork);
        var nOfSeries = innerWorkoutExecutionItem.activitySequenceItem.activityDefinition.activityWorkSequence.length;
        return '${workIndex + 1} of ${nOfSeries}${rest}';
      }
    }
  }

  @nullable
  String get notes {
    if (innerWorkoutExecutionItem.activitySequenceItem != null &&
        innerWorkoutExecutionItem.activityWork != null &&
        innerWorkoutExecutionItem.activityWork.numberOfRepetitions != null) {
      return '${innerWorkoutExecutionItem.activityWork.numberOfRepetitions} retitions';
    } else {
      return '';
    }
  }

  bool get isRest {
    return innerWorkoutExecutionItem.type == WorkoutExecutionItemType.REST;
  }

  bool get manualStop {
    if (innerWorkoutExecutionItem.activityWork != null) {
      if (isRest) {
        return innerWorkoutExecutionItem.activityWork.manualRestStop;
      } else {
        return innerWorkoutExecutionItem.activityWork.manualWorkStop;
      }
    } else {
      return false;
    }
  }

  @nullable
  int get durationSecs {
    if (innerWorkoutExecutionItem.activityWork != null) {
      if (isRest) {
        return innerWorkoutExecutionItem.activityWork.restDurationSecs;
      } else {
        return innerWorkoutExecutionItem.activityWork.workDurationSecs;
      }
    } else {
      return innerWorkoutExecutionItem.activitySequenceItem.restBetweenActivity;
    }
  }

  List<int> get startWorkTimestampsSec {
    return innerWorkoutExecutionItem.startWorkTimestampsSec.asList();
  }
  List<int> get stopWorkTimestampsSec {
    return innerWorkoutExecutionItem.stopWorkTimestampsSec.asList();
  }

}

enum WorkoutExecutionItemType {

  WARMUP,
  COOLDOWN,
  REST,
  WORK,
  INTER_ACTIVITY_REST

}