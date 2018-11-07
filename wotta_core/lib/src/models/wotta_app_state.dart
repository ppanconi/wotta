library wotta_app_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'domain/workout.dart';
import 'entity_editing_status.dart';

part 'wotta_app_state.g.dart';

abstract class WottaAppState implements Built<WottaAppState, WottaAppStateBuilder> {
  static Serializer<WottaAppState> get serializer => _$wottaAppStateSerializer;

  int get status;

  String get statusReport;

  BuiltList<Workout> get workouts;

  @nullable
  Workout get creatingWorkout;

  @nullable
  EntityEditingStatus  get currentEditingStatus;

  WottaAppState._();

  factory WottaAppState([updates(WottaAppStateBuilder b)]) => _$WottaAppState((bulder) => bulder
    ..statusReport = ''
    ..status = 0
    ..workouts = ListBuilder<Workout>([])
    ..update(updates)
  );

}
