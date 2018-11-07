import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/keys.dart';
import 'package:wotta_flutter/presentation/workout.dart';

class WorkoutsConnetor extends StoreConnector<WottaAppState, WottaActions, BuiltList<Workout>> {

  @override
  Widget build(BuildContext context, BuiltList<Workout> state, WottaActions actions) {
    return WorkoutList(
      workouts: state,
      onRemove: (workout ) => actions.deleteWorkoutAction(workout.id),
      onUndoRemove: (workout ) => actions.restoreWorkoutAction(workout),
    );

  }

  @override
  BuiltList<Workout> connect(WottaAppState state) => state.workouts;
}

class AddWorkoutConnector extends StoreConnector<WottaAppState, WottaActions, Workout> {

  AddWorkoutConnector();

  @override
  Widget build(BuildContext context, Workout state, WottaActions actions) {
    return WorkoutDetailView(
        key: WottaKeys.addWorkout,
        workout: state,
        confirmCallback: (Workout workout) {
          actions.addWorkoutAction(workout);
        }
    );
  }

  @override
  Workout connect(WottaAppState state) {
    assert(state.creatingWorkout != null);
    return state.creatingWorkout;
  }

}

class EditWorkoutConnector extends StoreConnector<WottaAppState, WottaActions, Workout> {

  final Workout workout;

  EditWorkoutConnector(this.workout);

  @override
  Widget build(BuildContext context, Workout state, WottaActions actions) {
    return WorkoutDetailView(
        key: WottaKeys.saveWorkout,
        workout: state,
        confirmCallback: (Workout workout) {
          actions.saveWorkoutAction(workout);
        }
    );
  }

  @override
  Workout connect(WottaAppState state) {
    return workout;
  }

}