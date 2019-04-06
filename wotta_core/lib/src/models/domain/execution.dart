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

  @nullable
  int get currentExecutionItemIndex;

  bool get isPaused;

  /**
   * !!!! DONT CONSERVE INSTANCES FROM THIS METHOD
   * USE ONLY TO PRESENTATION PURPOSE
   */
  ExecutionItem get currentExecutionItem =>
    currentExecutionItemIndex != null ? execution.items[currentExecutionItemIndex] : null;


}

abstract class Execution {
  String get title;
  List<ExecutionItem> get items;
  DateTime get startedAt;

  Duration get spentTime;

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

  Duration get spentTime;

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

class WorkoutExecutionSerializer implements StructuredSerializer<WorkoutExecution> {
  @override
  final Iterable<Type> types = const [
    WorkoutExecution,
    Execution
  ];

  @override
  String wireName = 'WorkoutExecution';

  @override
  WorkoutExecution deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {

    InnerWorkoutExecution innerWorkoutExecution;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'innerWorkoutExecution':
          innerWorkoutExecution = serializers.deserialize(value,
              specifiedType: const FullType(InnerWorkoutExecution)) as InnerWorkoutExecution;
          break;
      }
    }

    return WorkoutExecution(innerWorkoutExecution);
  }

  @override
  Iterable serialize(Serializers serializers, WorkoutExecution object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'innerWorkoutExecution',
      serializers.serialize(object.innerWorkoutExecution,
          specifiedType: const FullType(InnerWorkoutExecution))
    ];
    return result;
  }

}

class WorkoutExecution extends Execution with _WorkoutExecutionMixin {
  InnerWorkoutExecution innerWorkoutExecution;

  static Serializer<WorkoutExecution> get serializer => WorkoutExecutionSerializer();

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

  DateTime get startedAt {
    if (items.length > 0 && items[0].startWorkTimestampsSec.length > 0) {
      return DateTime.fromMillisecondsSinceEpoch(items[0].startWorkTimestampsSec[0]);
    }

    return null;
  }

  Duration get spentTime {
     return items.fold(Duration(seconds: 0), (partial, element) => partial + element.spentTime);
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


class WorkoutExecutionItemSerializer implements StructuredSerializer<WorkoutExecutionItem> {
  @override
  final Iterable<Type> types = const [
    WorkoutExecutionItem,
    ExecutionItem
  ];

  @override
  String wireName = 'WorkoutExecutionItem';

  @override
  WorkoutExecutionItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    InnerWorkoutExecutionItem innerWorkoutExecutionItem;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'innerWorkoutExecutionItem':
          innerWorkoutExecutionItem = serializers.deserialize(value,
              specifiedType: const FullType(
                  InnerWorkoutExecutionItem)) as InnerWorkoutExecutionItem;
          break;
      }
    }

    return WorkoutExecutionItem(innerWorkoutExecutionItem);
  }

  @override
  Iterable serialize(Serializers serializers, WorkoutExecutionItem object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'innerWorkoutExecutionItem',
      serializers.serialize(object.innerWorkoutExecutionItem,
          specifiedType: const FullType(InnerWorkoutExecutionItem))
    ];
    return result;
  }
}


class WorkoutExecutionItem extends ExecutionItem with _WorkoutExecutionItemMixin {

  static Serializer<WorkoutExecutionItem> get serializer => WorkoutExecutionItemSerializer();

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

  Duration get spentTime {

    int mills = 0;

    for(int i = 0; i < innerWorkoutExecutionItem.stopWorkTimestampsSec.length; i++) {
      mills += innerWorkoutExecutionItem.stopWorkTimestampsSec[i] -
        innerWorkoutExecutionItem.startWorkTimestampsSec[i];
    }
    return Duration(milliseconds: mills);
  }

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

class WorkoutExecutionItemType extends EnumClass{

  static Serializer<WorkoutExecutionItemType> get serializer => _$workoutExecutionItemTypeSerializer;

  static const WorkoutExecutionItemType WARMUP = _$WARMUP;
  static const WorkoutExecutionItemType COOLDOWN = _$COOLDOWN;
  static const WorkoutExecutionItemType REST = _$REST;
  static const WorkoutExecutionItemType WORK = _$WORK;
  static const WorkoutExecutionItemType INTER_ACTIVITY_REST = _$INTER_ACTIVITY_REST;

  const WorkoutExecutionItemType._(String name) : super(name);

  static BuiltSet<WorkoutExecutionItemType> get values => _$values;
  static WorkoutExecutionItemType valueOf(String name) => _$valueOf(name);
}