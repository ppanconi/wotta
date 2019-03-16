// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$WottaActions extends WottaActions {
  factory _$WottaActions() => new _$WottaActions._();
  _$WottaActions._() : super._();

  final ActionDispatcher<Workout> addWorkoutAction =
      new ActionDispatcher<Workout>('WottaActions-addWorkoutAction');
  final ActionDispatcher<Workout> restoreWorkoutAction =
      new ActionDispatcher<Workout>('WottaActions-restoreWorkoutAction');
  final ActionDispatcher<String> deleteWorkoutAction =
      new ActionDispatcher<String>('WottaActions-deleteWorkoutAction');
  final ActionDispatcher<Workout> saveWorkoutAction =
      new ActionDispatcher<Workout>('WottaActions-saveWorkoutAction');
  final ActionDispatcher<Null> createNewWorkoutAction =
      new ActionDispatcher<Null>('WottaActions-createNewWorkoutAction');
  final ActionDispatcher<EntityEditingStatus> updateEntityEditingStatus =
      new ActionDispatcher<EntityEditingStatus>(
          'WottaActions-updateEntityEditingStatus');
  final ActionDispatcher<Workout> explodeWorkoutDefinition =
      new ActionDispatcher<Workout>('WottaActions-explodeWorkoutDefinition');
  final ActionDispatcher<Workout> startWorkoutExecution =
      new ActionDispatcher<Workout>('WottaActions-startWorkoutExecution');
  final ActionDispatcher<Executor> togglePauseCurrentExecutionItem =
      new ActionDispatcher<Executor>(
          'WottaActions-togglePauseCurrentExecutionItem');
  final ActionDispatcher<CallbackPayload<Executor>>
      completeCurrentExecutionItem =
      new ActionDispatcher<CallbackPayload<Executor>>(
          'WottaActions-completeCurrentExecutionItem');
  final ActionDispatcher<WorkoutExecution> saveWorkoutExecution =
      new ActionDispatcher<WorkoutExecution>(
          'WottaActions-saveWorkoutExecution');
  final ActionDispatcher<WorkoutExecution> restoreExecutionAction =
      new ActionDispatcher<WorkoutExecution>(
          'WottaActions-restoreExecutionAction');
  final ActionDispatcher<WorkoutExecution> deleteExecutionAction =
      new ActionDispatcher<WorkoutExecution>(
          'WottaActions-deleteExecutionAction');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    addWorkoutAction.setDispatcher(dispatcher);
    restoreWorkoutAction.setDispatcher(dispatcher);
    deleteWorkoutAction.setDispatcher(dispatcher);
    saveWorkoutAction.setDispatcher(dispatcher);
    createNewWorkoutAction.setDispatcher(dispatcher);
    updateEntityEditingStatus.setDispatcher(dispatcher);
    explodeWorkoutDefinition.setDispatcher(dispatcher);
    startWorkoutExecution.setDispatcher(dispatcher);
    togglePauseCurrentExecutionItem.setDispatcher(dispatcher);
    completeCurrentExecutionItem.setDispatcher(dispatcher);
    saveWorkoutExecution.setDispatcher(dispatcher);
    restoreExecutionAction.setDispatcher(dispatcher);
    deleteExecutionAction.setDispatcher(dispatcher);
  }
}

class WottaActionsNames {
  static final ActionName<Workout> addWorkoutAction =
      new ActionName<Workout>('WottaActions-addWorkoutAction');
  static final ActionName<Workout> restoreWorkoutAction =
      new ActionName<Workout>('WottaActions-restoreWorkoutAction');
  static final ActionName<String> deleteWorkoutAction =
      new ActionName<String>('WottaActions-deleteWorkoutAction');
  static final ActionName<Workout> saveWorkoutAction =
      new ActionName<Workout>('WottaActions-saveWorkoutAction');
  static final ActionName<Null> createNewWorkoutAction =
      new ActionName<Null>('WottaActions-createNewWorkoutAction');
  static final ActionName<EntityEditingStatus> updateEntityEditingStatus =
      new ActionName<EntityEditingStatus>(
          'WottaActions-updateEntityEditingStatus');
  static final ActionName<Workout> explodeWorkoutDefinition =
      new ActionName<Workout>('WottaActions-explodeWorkoutDefinition');
  static final ActionName<Workout> startWorkoutExecution =
      new ActionName<Workout>('WottaActions-startWorkoutExecution');
  static final ActionName<Executor> togglePauseCurrentExecutionItem =
      new ActionName<Executor>('WottaActions-togglePauseCurrentExecutionItem');
  static final ActionName<CallbackPayload<Executor>>
      completeCurrentExecutionItem = new ActionName<CallbackPayload<Executor>>(
          'WottaActions-completeCurrentExecutionItem');
  static final ActionName<WorkoutExecution> saveWorkoutExecution =
      new ActionName<WorkoutExecution>('WottaActions-saveWorkoutExecution');
  static final ActionName<WorkoutExecution> restoreExecutionAction =
      new ActionName<WorkoutExecution>('WottaActions-restoreExecutionAction');
  static final ActionName<WorkoutExecution> deleteExecutionAction =
      new ActionName<WorkoutExecution>('WottaActions-deleteExecutionAction');
}
