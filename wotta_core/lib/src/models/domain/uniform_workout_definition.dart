library uniform_workout_definition;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uniform_workout_definition.g.dart';

abstract class ActivityUniformDefinition implements Built<ActivityUniformDefinition, ActivityUniformDefinitionBuilder> {
  // Add serialization support by defining this static getter.
  static Serializer<ActivityUniformDefinition> get serializer => _$activityUniformDefinitionSerializer;

  int get numberOfSeries;
  bool get manualStopSerie;
  @nullable
  int get serieDurationSecs;
  bool get manualStopRest;
  @nullable
  int get restDurationSecs;

  ActivityUniformDefinition._();

  factory ActivityUniformDefinition([void updates(ActivityUniformDefinitionBuilder b)]) = _$ActivityUniformDefinition;

  factory ActivityUniformDefinition.stadard([void updates(ActivityUniformDefinitionBuilder b)]) {

    return (new ActivityUniformDefinition((b) => b
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

  ActivityUniformDefinition get activityDefinition;

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
        ..activityDefinition = new ActivityUniformDefinition.stadard((b) => {}).toBuilder()
    ).toBuilder()
      ..update(updates)).build();
  }
}