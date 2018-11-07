// GENERATED CODE - DO NOT MODIFY BY HAND

part of workout;

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

Serializer<Workout> _$workoutSerializer = new _$WorkoutSerializer();

class _$WorkoutSerializer implements StructuredSerializer<Workout> {
  @override
  final Iterable<Type> types = const [Workout, _$Workout];
  @override
  final String wireName = 'Workout';

  @override
  Iterable serialize(Serializers serializers, Workout object,
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

    return result;
  }

  @override
  Workout deserialize(Serializers serializers, Iterable serialized,
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

  factory _$Workout([void updates(WorkoutBuilder b)]) =>
      (new WorkoutBuilder()..update(updates)).build();

  _$Workout._({this.id, this.title, this.notes, this.uniformWorkoutDefinition})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Workout', 'title');
    }
    if (uniformWorkoutDefinition == null) {
      throw new BuiltValueNullFieldError('Workout', 'uniformWorkoutDefinition');
    }
  }

  @override
  Workout rebuild(void updates(WorkoutBuilder b)) =>
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
        uniformWorkoutDefinition == other.uniformWorkoutDefinition;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), notes.hashCode),
        uniformWorkoutDefinition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Workout')
          ..add('id', id)
          ..add('title', title)
          ..add('notes', notes)
          ..add('uniformWorkoutDefinition', uniformWorkoutDefinition))
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

  WorkoutBuilder();

  WorkoutBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _notes = _$v.notes;
      _uniformWorkoutDefinition = _$v.uniformWorkoutDefinition?.toBuilder();
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
  void update(void updates(WorkoutBuilder b)) {
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
              uniformWorkoutDefinition: uniformWorkoutDefinition.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'uniformWorkoutDefinition';
        uniformWorkoutDefinition.build();
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
