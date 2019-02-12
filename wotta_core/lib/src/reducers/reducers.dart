import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:wotta_core/src/uuid.dart';
import '../actions/actions.dart';
import '../models/wotta_models.dart';

var wottaReducerBuilder = new ReducerBuilder<WottaAppState, WottaAppStateBuilder>()
  ..add(WottaActionsNames.addWorkoutAction, addworkout)
  ..add(WottaActionsNames.deleteWorkoutAction, deleteWorkout)
  ..add(WottaActionsNames.saveWorkoutAction, saveWorkout)
  ..add(WottaActionsNames.createNewWorkoutAction, createNewWorkout)
  ..add(WottaActionsNames.restoreWorkoutAction, restoreworkout)
  ..add(WottaActionsNames.updateEntityEditingStatus, updateEntityEditingStatus)
  ..add(WottaActionsNames.explodeWorkoutDefinition, explodeWorkoutDefinition)
;

void explodeWorkoutDefinition(WottaAppState state, Action<Workout> action, WottaAppStateBuilder builder) {

  var workout = action.payload;
  var uniformDef = workout.uniformWorkoutDefinition;

  var workoutExploded = workout.rebuild( (b) => b
    ..workoutDefinition = makeDefinitionFromUniformDefinition(uniformDef).toBuilder()
  );

  saveWorkout(state, Action(WottaActionsNames.saveWorkoutAction.name, workoutExploded), builder);
}

WorkoutDefinition makeDefinitionFromUniformDefinition(UniformWorkoutDefinition uniformDef) {
  return WorkoutDefinition.simple(
      uniformDef.warmupDurationSecs,
      uniformDef.calldownDurationSecs,
          (b) => b..activityDefinitionSequence.update((l) {
        for( var i = 0; i < uniformDef.numberOfActivity; i++) {

          l.add(ActivityDefinitionSequenceItem((b) => b
            ..restBetweenActivity = uniformDef.interActivityRestDurationSec
            ..activityDefinition = ActivityDefinition((b) => b
              ..name = 'Activity ${i + 1}'
              ..activityWorkSequence.update( (b) {
                for (var j = 0; j < uniformDef.activityDefinition.numberOfSeries; j++) {
                  b.add(ActivityWork((b) => b
                    ..manualWorkStop = uniformDef.activityDefinition.manualStopSerie
                    ..workDurationSecs = uniformDef.activityDefinition.serieDurationSecs
                    ..manualRestStop = uniformDef.activityDefinition.manualStopRest
                    ..restDurationSecs = uniformDef.activityDefinition.restDurationSecs
                  ));
                }
              })
            ).toBuilder()
          ));
        };
      })
  );
}

void addworkout(WottaAppState state, Action<Workout> action, WottaAppStateBuilder builder) {

  final newWorkout = action.payload;
  if (newWorkout.id != null) {
      builder
        ..status = 1
        ..statusReport = 'Invalid new Workaout, id provided';
  } else {
      builder..workouts.add(newWorkout.rebuild((b) => b.id = Uuid().generateV4()))
       ..creatingWorkout = null;
  }
}

void restoreworkout(WottaAppState state, Action<Workout> action, WottaAppStateBuilder builder) {

  final restoredWorkout = action.payload;
  if (restoredWorkout.id != null && !state.workouts.contains(restoredWorkout)) {
    builder.workouts.add(restoredWorkout);
  }
}

void deleteWorkout(WottaAppState state, Action<String> action, WottaAppStateBuilder builder) {
  builder.workouts.where((w) => w.id != action.payload);
}

void saveWorkout(WottaAppState state, Action<Workout> action, WottaAppStateBuilder builder) {

  if (action.payload.id == null || action.payload.id.length == 0) {
    builder
      ..status = 1
      ..statusReport = 'Invalid Workout, no id provided';
  } else {
    builder.workouts.map((w) => w.id == action.payload.id ? action.payload : w);
  }
}

void createNewWorkout(WottaAppState state, Action<Null> action, WottaAppStateBuilder builder) {
  builder.creatingWorkout =  new Workout((b) =>  b..title = '').toBuilder();
}

void updateEntityEditingStatus(WottaAppState state, Action<EntityEditingStatus> action, WottaAppStateBuilder builder) {
  builder.currentEditingStatus = action.payload.toBuilder();
}
