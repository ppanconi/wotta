// GENERATED CODE - DO NOT MODIFY BY HAND

part of wotta_app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<WottaAppState> _$wottaAppStateSerializer =
    new _$WottaAppStateSerializer();

class _$WottaAppStateSerializer implements StructuredSerializer<WottaAppState> {
  @override
  final Iterable<Type> types = const [WottaAppState, _$WottaAppState];
  @override
  final String wireName = 'WottaAppState';

  @override
  Iterable serialize(Serializers serializers, WottaAppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'workouts',
      serializers.serialize(object.workouts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Workout)])),
    ];

    return result;
  }

  @override
  WottaAppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WottaAppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'workouts':
          result.workouts.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Workout)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$WottaAppState extends WottaAppState {
  @override
  final int status;
  @override
  final String statusReport;
  @override
  final BuiltList<Workout> workouts;
  @override
  final Workout creatingWorkout;
  @override
  final EntityEditingStatus currentEditingStatus;
  @override
  final Executor executor;

  factory _$WottaAppState([void updates(WottaAppStateBuilder b)]) =>
      (new WottaAppStateBuilder()..update(updates)).build();

  _$WottaAppState._(
      {this.status,
      this.statusReport,
      this.workouts,
      this.creatingWorkout,
      this.currentEditingStatus,
      this.executor})
      : super._() {
    if (workouts == null) {
      throw new BuiltValueNullFieldError('WottaAppState', 'workouts');
    }
  }

  @override
  WottaAppState rebuild(void updates(WottaAppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  WottaAppStateBuilder toBuilder() => new WottaAppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WottaAppState &&
        status == other.status &&
        statusReport == other.statusReport &&
        workouts == other.workouts &&
        creatingWorkout == other.creatingWorkout &&
        currentEditingStatus == other.currentEditingStatus &&
        executor == other.executor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, status.hashCode), statusReport.hashCode),
                    workouts.hashCode),
                creatingWorkout.hashCode),
            currentEditingStatus.hashCode),
        executor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WottaAppState')
          ..add('status', status)
          ..add('statusReport', statusReport)
          ..add('workouts', workouts)
          ..add('creatingWorkout', creatingWorkout)
          ..add('currentEditingStatus', currentEditingStatus)
          ..add('executor', executor))
        .toString();
  }
}

class WottaAppStateBuilder
    implements Builder<WottaAppState, WottaAppStateBuilder> {
  _$WottaAppState _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _statusReport;
  String get statusReport => _$this._statusReport;
  set statusReport(String statusReport) => _$this._statusReport = statusReport;

  ListBuilder<Workout> _workouts;
  ListBuilder<Workout> get workouts =>
      _$this._workouts ??= new ListBuilder<Workout>();
  set workouts(ListBuilder<Workout> workouts) => _$this._workouts = workouts;

  WorkoutBuilder _creatingWorkout;
  WorkoutBuilder get creatingWorkout =>
      _$this._creatingWorkout ??= new WorkoutBuilder();
  set creatingWorkout(WorkoutBuilder creatingWorkout) =>
      _$this._creatingWorkout = creatingWorkout;

  EntityEditingStatusBuilder _currentEditingStatus;
  EntityEditingStatusBuilder get currentEditingStatus =>
      _$this._currentEditingStatus ??= new EntityEditingStatusBuilder();
  set currentEditingStatus(EntityEditingStatusBuilder currentEditingStatus) =>
      _$this._currentEditingStatus = currentEditingStatus;

  ExecutorBuilder _executor;
  ExecutorBuilder get executor => _$this._executor ??= new ExecutorBuilder();
  set executor(ExecutorBuilder executor) => _$this._executor = executor;

  WottaAppStateBuilder();

  WottaAppStateBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _statusReport = _$v.statusReport;
      _workouts = _$v.workouts?.toBuilder();
      _creatingWorkout = _$v.creatingWorkout?.toBuilder();
      _currentEditingStatus = _$v.currentEditingStatus?.toBuilder();
      _executor = _$v.executor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WottaAppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WottaAppState;
  }

  @override
  void update(void updates(WottaAppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$WottaAppState build() {
    _$WottaAppState _$result;
    try {
      _$result = _$v ??
          new _$WottaAppState._(
              status: status,
              statusReport: statusReport,
              workouts: workouts.build(),
              creatingWorkout: _creatingWorkout?.build(),
              currentEditingStatus: _currentEditingStatus?.build(),
              executor: _executor?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'workouts';
        workouts.build();
        _$failedField = 'creatingWorkout';
        _creatingWorkout?.build();
        _$failedField = 'currentEditingStatus';
        _currentEditingStatus?.build();
        _$failedField = 'executor';
        _executor?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WottaAppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
