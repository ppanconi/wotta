library workout_definition;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workout_definition.g.dart';

abstract class WorkoutDefinition implements Built<WorkoutDefinition, WorkoutDefinitionBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<WorkoutDefinition> get serializer => _$workoutDefinitionSerializer;

  @nullable
  String get id;

  @nullable
  ActivityWork get warmup;

  BuiltList<ActivityDefinitionSequenceItem> get activityDefinitionSequence;

  @nullable
  ActivityWork get cooldown;

  WorkoutDefinition._();
  factory WorkoutDefinition([void updates(WorkoutDefinitionBuilder b)]) = _$WorkoutDefinition;

  factory WorkoutDefinition.simple(int warmupDurationSecs, int cooldownDurationSecs, [void updates(WorkoutDefinitionBuilder b)])
    => _$WorkoutDefinition((b) => b
        ..warmup = ActivityWork((b) => b
          ..activityWorkIndex = 0
          ..manualRestStop = false
          ..restDurationSecs = 0
          ..manualWorkStop = false
          ..workDurationSecs = warmupDurationSecs).toBuilder()
      ..cooldown = ActivityWork((b) => b
        ..activityWorkIndex = 0
        ..manualRestStop = false
        ..restDurationSecs = 0
        ..manualWorkStop = false
        ..workDurationSecs = cooldownDurationSecs).toBuilder()
      ..update(updates)
    );
}

abstract class ActivityDefinitionSequenceItem
    implements Built<ActivityDefinitionSequenceItem, ActivityDefinitionSequenceItemBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<ActivityDefinitionSequenceItem> get serializer => _$activityDefinitionSequenceItemSerializer;

  ActivityDefinition get activityDefinition;
  int get restBetweenActivity;

  ActivityDefinitionSequenceItem._();
  factory ActivityDefinitionSequenceItem([void updates(ActivityDefinitionSequenceItemBuilder b)]) = _$ActivityDefinitionSequenceItem;

}

abstract class ActivityDefinition implements Built<ActivityDefinition, ActivityDefinitionBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<ActivityDefinition> get serializer => _$activityDefinitionSerializer;

  String get name;
  @nullable
  String get description;
  @nullable
  String get icon;
  @nullable
  String get video;

  BuiltList<ActivityWork> get activityWorkSequence;

  ActivityDefinition._();

  factory ActivityDefinition([void updates(ActivityDefinitionBuilder b)]) = _$ActivityDefinition;
}

abstract class ActivityWork implements Built<ActivityWork, ActivityWorkBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<ActivityWork> get serializer => _$activityWorkSerializer;
  ActivityWork._();
  factory ActivityWork([void updates(ActivityWorkBuilder b)]) = _$ActivityWork;

  int get activityWorkIndex;

  @nullable
  int get numberOfRepetitions;

  @nullable
  int get optimalDurationSecs;

  bool get manualWorkStop;

  @nullable
  int get workDurationSecs;

  bool get manualRestStop;

  @nullable
  int get restDurationSecs;

  bool get isWithoutWorkDuration => ! manualWorkStop && workDurationSecs == 0;

  bool get isWithoutRestDuration => ! manualRestStop && restDurationSecs == 0;

  bool get isWithoutDuration =>  isWithoutRestDuration && isWithoutWorkDuration;

}
