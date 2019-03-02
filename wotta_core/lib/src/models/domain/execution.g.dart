// GENERATED CODE - DO NOT MODIFY BY HAND

part of execution;

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

const WorkoutExecutionItemType _$WARMUP =
    const WorkoutExecutionItemType._('WARMUP');
const WorkoutExecutionItemType _$COOLDOWN =
    const WorkoutExecutionItemType._('COOLDOWN');
const WorkoutExecutionItemType _$REST =
    const WorkoutExecutionItemType._('REST');
const WorkoutExecutionItemType _$WORK =
    const WorkoutExecutionItemType._('WORK');
const WorkoutExecutionItemType _$INTER_ACTIVITY_REST =
    const WorkoutExecutionItemType._('INTER_ACTIVITY_REST');

WorkoutExecutionItemType _$valueOf(String name) {
  switch (name) {
    case 'WARMUP':
      return _$WARMUP;
    case 'COOLDOWN':
      return _$COOLDOWN;
    case 'REST':
      return _$REST;
    case 'WORK':
      return _$WORK;
    case 'INTER_ACTIVITY_REST':
      return _$INTER_ACTIVITY_REST;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WorkoutExecutionItemType> _$values =
    new BuiltSet<WorkoutExecutionItemType>(const <WorkoutExecutionItemType>[
  _$WARMUP,
  _$COOLDOWN,
  _$REST,
  _$WORK,
  _$INTER_ACTIVITY_REST,
]);

Serializer<Executor> _$executorSerializer = new _$ExecutorSerializer();
Serializer<InnerWorkoutExecution> _$innerWorkoutExecutionSerializer =
    new _$InnerWorkoutExecutionSerializer();
Serializer<InnerWorkoutExecutionItem> _$innerWorkoutExecutionItemSerializer =
    new _$InnerWorkoutExecutionItemSerializer();
Serializer<WorkoutExecutionItemType> _$workoutExecutionItemTypeSerializer =
    new _$WorkoutExecutionItemTypeSerializer();

class _$ExecutorSerializer implements StructuredSerializer<Executor> {
  @override
  final Iterable<Type> types = const [Executor, _$Executor];
  @override
  final String wireName = 'Executor';

  @override
  Iterable serialize(Serializers serializers, Executor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'execution',
      serializers.serialize(object.execution,
          specifiedType: const FullType(Execution)),
      'isPaused',
      serializers.serialize(object.isPaused,
          specifiedType: const FullType(bool)),
    ];
    if (object.currentExecutionItem != null) {
      result
        ..add('currentExecutionItem')
        ..add(serializers.serialize(object.currentExecutionItem,
            specifiedType: const FullType(ExecutionItem)));
    }

    return result;
  }

  @override
  Executor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExecutorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'execution':
          result.execution = serializers.deserialize(value,
              specifiedType: const FullType(Execution)) as Execution;
          break;
        case 'currentExecutionItem':
          result.currentExecutionItem = serializers.deserialize(value,
              specifiedType: const FullType(ExecutionItem)) as ExecutionItem;
          break;
        case 'isPaused':
          result.isPaused = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$InnerWorkoutExecutionSerializer
    implements StructuredSerializer<InnerWorkoutExecution> {
  @override
  final Iterable<Type> types = const [
    InnerWorkoutExecution,
    _$InnerWorkoutExecution
  ];
  @override
  final String wireName = 'InnerWorkoutExecution';

  @override
  Iterable serialize(Serializers serializers, InnerWorkoutExecution object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'workout',
      serializers.serialize(object.workout,
          specifiedType: const FullType(Workout)),
      'definition',
      serializers.serialize(object.definition,
          specifiedType: const FullType(WorkoutDefinition)),
      'executionItems',
      serializers.serialize(object.executionItems,
          specifiedType: const FullType(
              BuiltList, const [const FullType(InnerWorkoutExecutionItem)])),
    ];

    return result;
  }

  @override
  InnerWorkoutExecution deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InnerWorkoutExecutionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'workout':
          result.workout.replace(serializers.deserialize(value,
              specifiedType: const FullType(Workout)) as Workout);
          break;
        case 'definition':
          result.definition.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WorkoutDefinition))
              as WorkoutDefinition);
          break;
        case 'executionItems':
          result.executionItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(InnerWorkoutExecutionItem)
              ])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$InnerWorkoutExecutionItemSerializer
    implements StructuredSerializer<InnerWorkoutExecutionItem> {
  @override
  final Iterable<Type> types = const [
    InnerWorkoutExecutionItem,
    _$InnerWorkoutExecutionItem
  ];
  @override
  final String wireName = 'InnerWorkoutExecutionItem';

  @override
  Iterable serialize(Serializers serializers, InnerWorkoutExecutionItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(WorkoutExecutionItemType)),
      'startWorkTimestampsSec',
      serializers.serialize(object.startWorkTimestampsSec,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'stopWorkTimestampsSec',
      serializers.serialize(object.stopWorkTimestampsSec,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.activitySequenceItem != null) {
      result
        ..add('activitySequenceItem')
        ..add(serializers.serialize(object.activitySequenceItem,
            specifiedType: const FullType(ActivityDefinitionSequenceItem)));
    }
    if (object.activityWork != null) {
      result
        ..add('activityWork')
        ..add(serializers.serialize(object.activityWork,
            specifiedType: const FullType(ActivityWork)));
    }

    return result;
  }

  @override
  InnerWorkoutExecutionItem deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InnerWorkoutExecutionItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activitySequenceItem':
          result.activitySequenceItem.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ActivityDefinitionSequenceItem))
              as ActivityDefinitionSequenceItem);
          break;
        case 'activityWork':
          result.activityWork.replace(serializers.deserialize(value,
              specifiedType: const FullType(ActivityWork)) as ActivityWork);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(WorkoutExecutionItemType))
              as WorkoutExecutionItemType;
          break;
        case 'startWorkTimestampsSec':
          result.startWorkTimestampsSec.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'stopWorkTimestampsSec':
          result.stopWorkTimestampsSec.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$WorkoutExecutionItemTypeSerializer
    implements PrimitiveSerializer<WorkoutExecutionItemType> {
  @override
  final Iterable<Type> types = const <Type>[WorkoutExecutionItemType];
  @override
  final String wireName = 'WorkoutExecutionItemType';

  @override
  Object serialize(Serializers serializers, WorkoutExecutionItemType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WorkoutExecutionItemType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WorkoutExecutionItemType.valueOf(serialized as String);
}

class _$Executor extends Executor {
  @override
  final Execution execution;
  @override
  final ExecutionItem currentExecutionItem;
  @override
  final bool isPaused;

  factory _$Executor([void updates(ExecutorBuilder b)]) =>
      (new ExecutorBuilder()..update(updates)).build();

  _$Executor._({this.execution, this.currentExecutionItem, this.isPaused})
      : super._() {
    if (execution == null) {
      throw new BuiltValueNullFieldError('Executor', 'execution');
    }
    if (isPaused == null) {
      throw new BuiltValueNullFieldError('Executor', 'isPaused');
    }
  }

  @override
  Executor rebuild(void updates(ExecutorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ExecutorBuilder toBuilder() => new ExecutorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Executor &&
        execution == other.execution &&
        currentExecutionItem == other.currentExecutionItem &&
        isPaused == other.isPaused;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, execution.hashCode), currentExecutionItem.hashCode),
        isPaused.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Executor')
          ..add('execution', execution)
          ..add('currentExecutionItem', currentExecutionItem)
          ..add('isPaused', isPaused))
        .toString();
  }
}

class ExecutorBuilder implements Builder<Executor, ExecutorBuilder> {
  _$Executor _$v;

  Execution _execution;
  Execution get execution => _$this._execution;
  set execution(Execution execution) => _$this._execution = execution;

  ExecutionItem _currentExecutionItem;
  ExecutionItem get currentExecutionItem => _$this._currentExecutionItem;
  set currentExecutionItem(ExecutionItem currentExecutionItem) =>
      _$this._currentExecutionItem = currentExecutionItem;

  bool _isPaused;
  bool get isPaused => _$this._isPaused;
  set isPaused(bool isPaused) => _$this._isPaused = isPaused;

  ExecutorBuilder();

  ExecutorBuilder get _$this {
    if (_$v != null) {
      _execution = _$v.execution;
      _currentExecutionItem = _$v.currentExecutionItem;
      _isPaused = _$v.isPaused;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Executor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Executor;
  }

  @override
  void update(void updates(ExecutorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Executor build() {
    final _$result = _$v ??
        new _$Executor._(
            execution: execution,
            currentExecutionItem: currentExecutionItem,
            isPaused: isPaused);
    replace(_$result);
    return _$result;
  }
}

class _$InnerWorkoutExecution extends InnerWorkoutExecution {
  @override
  final Workout workout;
  @override
  final WorkoutDefinition definition;
  @override
  final BuiltList<InnerWorkoutExecutionItem> executionItems;

  factory _$InnerWorkoutExecution(
          [void updates(InnerWorkoutExecutionBuilder b)]) =>
      (new InnerWorkoutExecutionBuilder()..update(updates)).build();

  _$InnerWorkoutExecution._(
      {this.workout, this.definition, this.executionItems})
      : super._() {
    if (workout == null) {
      throw new BuiltValueNullFieldError('InnerWorkoutExecution', 'workout');
    }
    if (definition == null) {
      throw new BuiltValueNullFieldError('InnerWorkoutExecution', 'definition');
    }
    if (executionItems == null) {
      throw new BuiltValueNullFieldError(
          'InnerWorkoutExecution', 'executionItems');
    }
  }

  @override
  InnerWorkoutExecution rebuild(void updates(InnerWorkoutExecutionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  InnerWorkoutExecutionBuilder toBuilder() =>
      new InnerWorkoutExecutionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InnerWorkoutExecution &&
        workout == other.workout &&
        definition == other.definition &&
        executionItems == other.executionItems;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, workout.hashCode), definition.hashCode),
        executionItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InnerWorkoutExecution')
          ..add('workout', workout)
          ..add('definition', definition)
          ..add('executionItems', executionItems))
        .toString();
  }
}

class InnerWorkoutExecutionBuilder
    implements Builder<InnerWorkoutExecution, InnerWorkoutExecutionBuilder> {
  _$InnerWorkoutExecution _$v;

  WorkoutBuilder _workout;
  WorkoutBuilder get workout => _$this._workout ??= new WorkoutBuilder();
  set workout(WorkoutBuilder workout) => _$this._workout = workout;

  WorkoutDefinitionBuilder _definition;
  WorkoutDefinitionBuilder get definition =>
      _$this._definition ??= new WorkoutDefinitionBuilder();
  set definition(WorkoutDefinitionBuilder definition) =>
      _$this._definition = definition;

  ListBuilder<InnerWorkoutExecutionItem> _executionItems;
  ListBuilder<InnerWorkoutExecutionItem> get executionItems =>
      _$this._executionItems ??= new ListBuilder<InnerWorkoutExecutionItem>();
  set executionItems(ListBuilder<InnerWorkoutExecutionItem> executionItems) =>
      _$this._executionItems = executionItems;

  InnerWorkoutExecutionBuilder();

  InnerWorkoutExecutionBuilder get _$this {
    if (_$v != null) {
      _workout = _$v.workout?.toBuilder();
      _definition = _$v.definition?.toBuilder();
      _executionItems = _$v.executionItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InnerWorkoutExecution other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InnerWorkoutExecution;
  }

  @override
  void update(void updates(InnerWorkoutExecutionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$InnerWorkoutExecution build() {
    _$InnerWorkoutExecution _$result;
    try {
      _$result = _$v ??
          new _$InnerWorkoutExecution._(
              workout: workout.build(),
              definition: definition.build(),
              executionItems: executionItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'workout';
        workout.build();
        _$failedField = 'definition';
        definition.build();
        _$failedField = 'executionItems';
        executionItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InnerWorkoutExecution', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$InnerWorkoutExecutionItem extends InnerWorkoutExecutionItem {
  @override
  final ActivityDefinitionSequenceItem activitySequenceItem;
  @override
  final ActivityWork activityWork;
  @override
  final WorkoutExecutionItemType type;
  @override
  final BuiltList<int> startWorkTimestampsSec;
  @override
  final BuiltList<int> stopWorkTimestampsSec;

  factory _$InnerWorkoutExecutionItem(
          [void updates(InnerWorkoutExecutionItemBuilder b)]) =>
      (new InnerWorkoutExecutionItemBuilder()..update(updates)).build();

  _$InnerWorkoutExecutionItem._(
      {this.activitySequenceItem,
      this.activityWork,
      this.type,
      this.startWorkTimestampsSec,
      this.stopWorkTimestampsSec})
      : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('InnerWorkoutExecutionItem', 'type');
    }
    if (startWorkTimestampsSec == null) {
      throw new BuiltValueNullFieldError(
          'InnerWorkoutExecutionItem', 'startWorkTimestampsSec');
    }
    if (stopWorkTimestampsSec == null) {
      throw new BuiltValueNullFieldError(
          'InnerWorkoutExecutionItem', 'stopWorkTimestampsSec');
    }
  }

  @override
  InnerWorkoutExecutionItem rebuild(
          void updates(InnerWorkoutExecutionItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  InnerWorkoutExecutionItemBuilder toBuilder() =>
      new InnerWorkoutExecutionItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InnerWorkoutExecutionItem &&
        activitySequenceItem == other.activitySequenceItem &&
        activityWork == other.activityWork &&
        type == other.type &&
        startWorkTimestampsSec == other.startWorkTimestampsSec &&
        stopWorkTimestampsSec == other.stopWorkTimestampsSec;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc(0, activitySequenceItem.hashCode),
                    activityWork.hashCode),
                type.hashCode),
            startWorkTimestampsSec.hashCode),
        stopWorkTimestampsSec.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InnerWorkoutExecutionItem')
          ..add('activitySequenceItem', activitySequenceItem)
          ..add('activityWork', activityWork)
          ..add('type', type)
          ..add('startWorkTimestampsSec', startWorkTimestampsSec)
          ..add('stopWorkTimestampsSec', stopWorkTimestampsSec))
        .toString();
  }
}

class InnerWorkoutExecutionItemBuilder
    implements
        Builder<InnerWorkoutExecutionItem, InnerWorkoutExecutionItemBuilder> {
  _$InnerWorkoutExecutionItem _$v;

  ActivityDefinitionSequenceItemBuilder _activitySequenceItem;
  ActivityDefinitionSequenceItemBuilder get activitySequenceItem =>
      _$this._activitySequenceItem ??=
          new ActivityDefinitionSequenceItemBuilder();
  set activitySequenceItem(
          ActivityDefinitionSequenceItemBuilder activitySequenceItem) =>
      _$this._activitySequenceItem = activitySequenceItem;

  ActivityWorkBuilder _activityWork;
  ActivityWorkBuilder get activityWork =>
      _$this._activityWork ??= new ActivityWorkBuilder();
  set activityWork(ActivityWorkBuilder activityWork) =>
      _$this._activityWork = activityWork;

  WorkoutExecutionItemType _type;
  WorkoutExecutionItemType get type => _$this._type;
  set type(WorkoutExecutionItemType type) => _$this._type = type;

  ListBuilder<int> _startWorkTimestampsSec;
  ListBuilder<int> get startWorkTimestampsSec =>
      _$this._startWorkTimestampsSec ??= new ListBuilder<int>();
  set startWorkTimestampsSec(ListBuilder<int> startWorkTimestampsSec) =>
      _$this._startWorkTimestampsSec = startWorkTimestampsSec;

  ListBuilder<int> _stopWorkTimestampsSec;
  ListBuilder<int> get stopWorkTimestampsSec =>
      _$this._stopWorkTimestampsSec ??= new ListBuilder<int>();
  set stopWorkTimestampsSec(ListBuilder<int> stopWorkTimestampsSec) =>
      _$this._stopWorkTimestampsSec = stopWorkTimestampsSec;

  InnerWorkoutExecutionItemBuilder();

  InnerWorkoutExecutionItemBuilder get _$this {
    if (_$v != null) {
      _activitySequenceItem = _$v.activitySequenceItem?.toBuilder();
      _activityWork = _$v.activityWork?.toBuilder();
      _type = _$v.type;
      _startWorkTimestampsSec = _$v.startWorkTimestampsSec?.toBuilder();
      _stopWorkTimestampsSec = _$v.stopWorkTimestampsSec?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InnerWorkoutExecutionItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InnerWorkoutExecutionItem;
  }

  @override
  void update(void updates(InnerWorkoutExecutionItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$InnerWorkoutExecutionItem build() {
    _$InnerWorkoutExecutionItem _$result;
    try {
      _$result = _$v ??
          new _$InnerWorkoutExecutionItem._(
              activitySequenceItem: _activitySequenceItem?.build(),
              activityWork: _activityWork?.build(),
              type: type,
              startWorkTimestampsSec: startWorkTimestampsSec.build(),
              stopWorkTimestampsSec: stopWorkTimestampsSec.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activitySequenceItem';
        _activitySequenceItem?.build();
        _$failedField = 'activityWork';
        _activityWork?.build();

        _$failedField = 'startWorkTimestampsSec';
        startWorkTimestampsSec.build();
        _$failedField = 'stopWorkTimestampsSec';
        stopWorkTimestampsSec.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InnerWorkoutExecutionItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
