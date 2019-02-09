import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:wotta_core/src/models/domain/workout_definition.dart';
import 'package:wotta_core/wotta_core.dart';

main() {

  final workout = Workout((b) => b
      ..id = 'myid'
      ..title = "mytitle"
  );
  print('My first Workout:${workout}');


  print('Workout Json: ${json.encode(standardSerializers.serializeWith(Workout.serializer, workout))}');

  final workoutDefinition = WorkoutDefinition((b) => b
      ..id = "definition1"
      ..activityDefinitionSequence.add(ActivityDefinitionSequenceItem((as) => as
          ..restBetweenActivity = 30
          ..activityDefinition.name = "Bench Press"
          ..activityDefinition.description = "Push up press on horizontal bench"
          ..activityDefinition.icon = 'icon1'
          ..activityDefinition.video = 'video1')
      )
      ..activityDefinitionSequence.add(ActivityDefinitionSequenceItem((as) => as
      ..restBetweenActivity = 30
      ..activityDefinition.name = "Squatt"
      ..activityDefinition.description = "Squat"
      ..activityDefinition.icon = 'icon2'
      ..activityDefinition.video = 'video2')
    )

  );
  print('WorkoutDefinition ${workoutDefinition}');

  print('WorkoutDefinition Json: ${json.encode(standardSerializers.serializeWith(WorkoutDefinition.serializer, workoutDefinition))}');

}
