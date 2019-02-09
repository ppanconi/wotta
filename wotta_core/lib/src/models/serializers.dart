
library serializers;

import 'package:wotta_core/src/models/domain/uniform_workout_definition.dart';
import 'package:wotta_core/src/models/domain/workout_definition.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Workout,
  UniformWorkoutDefinition,
  ActivityUniformDefinition,
  WorkoutDefinition,
  ActivityDefinitionSequenceItem,
  ActivityDefinition,
  ActivityWork
])
final Serializers serializers = _$serializers;

final standardSerializers =
(serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
