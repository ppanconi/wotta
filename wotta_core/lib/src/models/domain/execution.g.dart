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

Serializer<InnerWorkoutExecution> _$innerWorkoutExecutionSerializer =
    new _$InnerWorkoutExecutionSerializer();
Serializer<InnerWorkoutExecutionItem> _$innerWorkoutExecutionItemSerializer =
    new _$InnerWorkoutExecutionItemSerializer();

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
      'workoutItems',
      serializers.serialize(object.workoutItems,
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
        case 'workoutItems':
          result.workoutItems.replace(serializers.deserialize(value,
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
      serializers.serialize(object.type, specifiedType: const FullType(String)),
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
              specifiedType: const FullType(String)) as String;
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

class _$InnerWorkoutExecution extends InnerWorkoutExecution {
  @override
  final Workout workout;
  @override
  final WorkoutDefinition definition;
  @override
  final BuiltList<InnerWorkoutExecutionItem> workoutItems;

  factory _$InnerWorkoutExecution(
          [void updates(InnerWorkoutExecutionBuilder b)]) =>
      (new InnerWorkoutExecutionBuilder()..update(updates)).build();

  _$InnerWorkoutExecution._({this.workout, this.definition, this.workoutItems})
      : super._() {
    if (workout == null) {
      throw new BuiltValueNullFieldError('InnerWorkoutExecution', 'workout');
    }
    if (definition == null) {
      throw new BuiltValueNullFieldError('InnerWorkoutExecution', 'definition');
    }
    if (workoutItems == null) {
      throw new BuiltValueNullFieldError(
          'InnerWorkoutExecution', 'workoutItems');
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
        workoutItems == other.workoutItems;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, workout.hashCode), definition.hashCode),
        workoutItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InnerWorkoutExecution')
          ..add('workout', workout)
          ..add('definition', definition)
          ..add('workoutItems', workoutItems))
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

  ListBuilder<InnerWorkoutExecutionItem> _workoutItems;
  ListBuilder<InnerWorkoutExecutionItem> get workoutItems =>
      _$this._workoutItems ??= new ListBuilder<InnerWorkoutExecutionItem>();
  set workoutItems(ListBuilder<InnerWorkoutExecutionItem> workoutItems) =>
      _$this._workoutItems = workoutItems;

  InnerWorkoutExecutionBuilder();

  InnerWorkoutExecutionBuilder get _$this {
    if (_$v != null) {
      _workout = _$v.workout?.toBuilder();
      _definition = _$v.definition?.toBuilder();
      _workoutItems = _$v.workoutItems?.toBuilder();
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
              workoutItems: workoutItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'workout';
        workout.build();
        _$failedField = 'definition';
        definition.build();
        _$failedField = 'workoutItems';
        workoutItems.build();
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
  final String type;
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

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

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
