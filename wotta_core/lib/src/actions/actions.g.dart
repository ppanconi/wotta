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

  @override
  void setDispatcher(Dispatcher dispatcher) {
    addWorkoutAction.setDispatcher(dispatcher);
    restoreWorkoutAction.setDispatcher(dispatcher);
    deleteWorkoutAction.setDispatcher(dispatcher);
    saveWorkoutAction.setDispatcher(dispatcher);
    createNewWorkoutAction.setDispatcher(dispatcher);
    updateEntityEditingStatus.setDispatcher(dispatcher);
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
}