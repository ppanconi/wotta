// GENERATED CODE - DO NOT MODIFY BY HAND

part of wotta_app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WottaAppState> _$wottaAppStateSerializer =
    new _$WottaAppStateSerializer();

class _$WottaAppStateSerializer implements StructuredSerializer<WottaAppState> {
  @override
  final Iterable<Type> types = const [WottaAppState, _$WottaAppState];
  @override
  final String wireName = 'WottaAppState';

  @override
  Iterable<Object> serialize(Serializers serializers, WottaAppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'workouts',
      serializers.serialize(object.workouts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Workout)])),
      'executions',
      serializers.serialize(object.executions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WorkoutExecution)])),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  WottaAppState deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
                      BuiltList, const [const FullType(Workout)]))
              as BuiltList<dynamic>);
          break;
        case 'executions':
          result.executions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WorkoutExecution)]))
              as BuiltList<dynamic>);
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final BuiltList<WorkoutExecution> executions;
  @override
  final Workout creatingWorkout;
  @override
  final EntityEditingStatus currentEditingStatus;
  @override
  final Executor executor;
  @override
  final int version;

  factory _$WottaAppState([void Function(WottaAppStateBuilder) updates]) =>
      (new WottaAppStateBuilder()..update(updates)).build();

  _$WottaAppState._(
      {this.status,
      this.statusReport,
      this.workouts,
      this.executions,
      this.creatingWorkout,
      this.currentEditingStatus,
      this.executor,
      this.version})
      : super._() {
    if (workouts == null) {
      throw new BuiltValueNullFieldError('WottaAppState', 'workouts');
    }
    if (executions == null) {
      throw new BuiltValueNullFieldError('WottaAppState', 'executions');
    }
    if (version == null) {
      throw new BuiltValueNullFieldError('WottaAppState', 'version');
    }
  }

  @override
  WottaAppState rebuild(void Function(WottaAppStateBuilder) updates) =>
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
        executions == other.executions &&
        creatingWorkout == other.creatingWorkout &&
        currentEditingStatus == other.currentEditingStatus &&
        executor == other.executor &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, status.hashCode), statusReport.hashCode),
                            workouts.hashCode),
                        executions.hashCode),
                    creatingWorkout.hashCode),
                currentEditingStatus.hashCode),
            executor.hashCode),
        version.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WottaAppState')
          ..add('status', status)
          ..add('statusReport', statusReport)
          ..add('workouts', workouts)
          ..add('executions', executions)
          ..add('creatingWorkout', creatingWorkout)
          ..add('currentEditingStatus', currentEditingStatus)
          ..add('executor', executor)
          ..add('version', version))
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

  ListBuilder<WorkoutExecution> _executions;
  ListBuilder<WorkoutExecution> get executions =>
      _$this._executions ??= new ListBuilder<WorkoutExecution>();
  set executions(ListBuilder<WorkoutExecution> executions) =>
      _$this._executions = executions;

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

  int _version;
  int get version => _$this._version;
  set version(int version) => _$this._version = version;

  WottaAppStateBuilder();

  WottaAppStateBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _statusReport = _$v.statusReport;
      _workouts = _$v.workouts?.toBuilder();
      _executions = _$v.executions?.toBuilder();
      _creatingWorkout = _$v.creatingWorkout?.toBuilder();
      _currentEditingStatus = _$v.currentEditingStatus?.toBuilder();
      _executor = _$v.executor?.toBuilder();
      _version = _$v.version;
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
  void update(void Function(WottaAppStateBuilder) updates) {
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
              executions: executions.build(),
              creatingWorkout: _creatingWorkout?.build(),
              currentEditingStatus: _currentEditingStatus?.build(),
              executor: _executor?.build(),
              version: version);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'workouts';
        workouts.build();
        _$failedField = 'executions';
        executions.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
