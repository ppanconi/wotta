library actions;

import 'package:built_redux/built_redux.dart';
import 'package:wotta_core/wotta_core.dart';

part 'actions.g.dart';

abstract class WottaActions extends ReduxActions {

  ActionDispatcher<Workout> addWorkoutAction;
  ActionDispatcher<Workout> restoreWorkoutAction;
  //Delete a Workout using the id
  ActionDispatcher<String> deleteWorkoutAction;
  ActionDispatcher<Workout> saveWorkoutAction;

  ActionDispatcher<Null> createNewWorkoutAction;

  ActionDispatcher<EntityEditingStatus> updateEntityEditingStatus;

  ActionDispatcher<Workout> explodeWorkoutDefinition;

  ActionDispatcher<Workout> startWorkoutExecution;

  ActionDispatcher<Executor> togglePauseCurrentExecutionItem;

  ActionDispatcher<Executor> completeCurrentExecutionItem;

  WottaActions._();

  factory WottaActions() => _$WottaActions();
}