library workout;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:wotta_core/src/models/domain/uniform_workout_definition.dart';
import 'package:wotta_core/wotta_core.dart';

part 'workout.g.dart';


abstract class Workout implements Built<Workout, WorkoutBuilder>, Entity {
  // Add serialization support by defining this static getter.
  static Serializer<Workout> get serializer => _$workoutSerializer;

  @nullable
  String get id;
  String get title;
  @nullable
  String get notes;

  UniformWorkoutDefinition get uniformWorkoutDefinition;

  Workout._();

  factory Workout([void updates(WorkoutBuilder b)]) =>
      _$Workout((b) => b
        ..uniformWorkoutDefinition = UniformWorkoutDefinition.stadard((d) => {}).toBuilder()
        ..update(updates)
      );

  bool isSaved() => id != null;

  @override
  String typeName() {
    return "Workout";
  }

  @override
  String provideId() {
    return id;
  }


}