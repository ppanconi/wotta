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
;

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
