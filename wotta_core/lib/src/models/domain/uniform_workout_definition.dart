library uniform_workout_definition;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uniform_workout_definition.g.dart';

abstract class ActivityDefinition implements Built<ActivityDefinition, ActivityDefinitionBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<ActivityDefinition> get serializer => _$activityDefinitionSerializer;

  int get numberOfSeries;
  bool get manualStopSerie;
  @nullable
  int get serieDurationSecs;
  bool get manualStopRest;
  @nullable
  int get restDurationSecs;

  ActivityDefinition._();

  factory ActivityDefinition([void updates(ActivityDefinitionBuilder b)]) = _$ActivityDefinition;

  factory ActivityDefinition.stadard([void updates(ActivityDefinitionBuilder b)]) {

    return (new ActivityDefinition((b) => b
        ..numberOfSeries = 3
        ..manualStopSerie = true
        ..manualStopRest = false
        ..restDurationSecs = 45
    ).toBuilder()..update(updates)).build();
  }

}

abstract class UniformWorkoutDefinition implements Built<UniformWorkoutDefinition, UniformWorkoutDefinitionBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<UniformWorkoutDefinition> get serializer => _$uniformWorkoutDefinitionSerializer;

  @nullable
  String get id;

  int get warmupDurationSecs;

  ActivityDefinition get activityDefinition;

  int get numberOfActivity;

  int get interActivityRestDurationSec;

  int get calldownDurationSecs;

  UniformWorkoutDefinition._();
  factory UniformWorkoutDefinition([void updates(UniformWorkoutDefinitionBuilder b)]) = _$UniformWorkoutDefinition;

  factory UniformWorkoutDefinition.standard([void updates(UniformWorkoutDefinitionBuilder b)]) {
    return (new UniformWorkoutDefinition((ub) => ub
        ..warmupDurationSecs = 180
        ..numberOfActivity = 9
        ..interActivityRestDurationSec = 75
        ..calldownDurationSecs = 180
        ..activityDefinition = new ActivityDefinition.stadard((b) => {}).toBuilder()
    ).toBuilder()
      ..update(updates)).build();
  }
}