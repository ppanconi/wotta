// GENERATED CODE - DO NOT MODIFY BY HAND

part of workout;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Workout> _$workoutSerializer = new _$WorkoutSerializer();

class _$WorkoutSerializer implements StructuredSerializer<Workout> {
  @override
  final Iterable<Type> types = const [Workout, _$Workout];
  @override
  final String wireName = 'Workout';

  @override
  Iterable<Object> serialize(Serializers serializers, Workout object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'uniformWorkoutDefinition',
      serializers.serialize(object.uniformWorkoutDefinition,
          specifiedType: const FullType(UniformWorkoutDefinition)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.notes != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(object.notes,
            specifiedType: const FullType(String)));
    }
    if (object.workoutDefinition != null) {
      result
        ..add('workoutDefinition')
        ..add(serializers.serialize(object.workoutDefinition,
            specifiedType: const FullType(WorkoutDefinition)));
    }
    return result;
  }

  @override
  Workout deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkoutBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uniformWorkoutDefinition':
          result.uniformWorkoutDefinition.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UniformWorkoutDefinition))
              as UniformWorkoutDefinition);
          break;
        case 'workoutDefinition':
          result.workoutDefinition.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WorkoutDefinition))
              as WorkoutDefinition);
          break;
      }
    }

    return result.build();
  }
}

class _$Workout extends Workout {
  @override
  final String id;
  @override
  final String title;
  @override
  final String notes;
  @override
  final UniformWorkoutDefinition uniformWorkoutDefinition;
  @override
  final WorkoutDefinition workoutDefinition;

  factory _$Workout([void Function(WorkoutBuilder) updates]) =>
      (new WorkoutBuilder()..update(updates)).build();

  _$Workout._(
      {this.id,
      this.title,
      this.notes,
      this.uniformWorkoutDefinition,
      this.workoutDefinition})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Workout', 'title');
    }
    if (uniformWorkoutDefinition == null) {
      throw new BuiltValueNullFieldError('Workout', 'uniformWorkoutDefinition');
    }
  }

  @override
  Workout rebuild(void Function(WorkoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkoutBuilder toBuilder() => new WorkoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Workout &&
        id == other.id &&
        title == other.title &&
        notes == other.notes &&
        uniformWorkoutDefinition == other.uniformWorkoutDefinition &&
        workoutDefinition == other.workoutDefinition;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), notes.hashCode),
            uniformWorkoutDefinition.hashCode),
        workoutDefinition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Workout')
          ..add('id', id)
          ..add('title', title)
          ..add('notes', notes)
          ..add('uniformWorkoutDefinition', uniformWorkoutDefinition)
          ..add('workoutDefinition', workoutDefinition))
        .toString();
  }
}

class WorkoutBuilder implements Builder<Workout, WorkoutBuilder> {
  _$Workout _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  UniformWorkoutDefinitionBuilder _uniformWorkoutDefinition;
  UniformWorkoutDefinitionBuilder get uniformWorkoutDefinition =>
      _$this._uniformWorkoutDefinition ??=
          new UniformWorkoutDefinitionBuilder();
  set uniformWorkoutDefinition(
          UniformWorkoutDefinitionBuilder uniformWorkoutDefinition) =>
      _$this._uniformWorkoutDefinition = uniformWorkoutDefinition;

  WorkoutDefinitionBuilder _workoutDefinition;
  WorkoutDefinitionBuilder get workoutDefinition =>
      _$this._workoutDefinition ??= new WorkoutDefinitionBuilder();
  set workoutDefinition(WorkoutDefinitionBuilder workoutDefinition) =>
      _$this._workoutDefinition = workoutDefinition;

  WorkoutBuilder();

  WorkoutBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _notes = _$v.notes;
      _uniformWorkoutDefinition = _$v.uniformWorkoutDefinition?.toBuilder();
      _workoutDefinition = _$v.workoutDefinition?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Workout other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Workout;
  }

  @override
  void update(void Function(WorkoutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Workout build() {
    _$Workout _$result;
    try {
      _$result = _$v ??
          new _$Workout._(
              id: id,
              title: title,
              notes: notes,
              uniformWorkoutDefinition: uniformWorkoutDefinition.build(),
              workoutDefinition: _workoutDefinition?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'uniformWorkoutDefinition';
        uniformWorkoutDefinition.build();
        _$failedField = 'workoutDefinition';
        _workoutDefinition?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Workout', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
