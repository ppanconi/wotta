
library serializers;

import 'package:wotta_core/src/models/domain/uniform_workout_definition.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:built_value/serializer.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Workout,
  UniformWorkoutDefinition,
  ActivityDefinition
])
final Serializers serializers = _$serializers;



