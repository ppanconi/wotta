// GENERATED CODE - DO NOT MODIFY BY HAND

part of uniform_workout_definition;

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

Serializer<ActivityDefinition> _$activityDefinitionSerializer =
    new _$ActivityDefinitionSerializer();
Serializer<UniformWorkoutDefinition> _$uniformWorkoutDefinitionSerializer =
    new _$UniformWorkoutDefinitionSerializer();

class _$ActivityDefinitionSerializer
    implements StructuredSerializer<ActivityDefinition> {
  @override
  final Iterable<Type> types = const [ActivityDefinition, _$ActivityDefinition];
  @override
  final String wireName = 'ActivityDefinition';

  @override
  Iterable serialize(Serializers serializers, ActivityDefinition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'numberOfSeries',
      serializers.serialize(object.numberOfSeries,
          specifiedType: const FullType(int)),
      'manualStopSerie',
      serializers.serialize(object.manualStopSerie,
          specifiedType: const FullType(bool)),
      'manualStopRest',
      serializers.serialize(object.manualStopRest,
          specifiedType: const FullType(bool)),
    ];
    if (object.serieDurationSecs != null) {
      result
        ..add('serieDurationSecs')
        ..add(serializers.serialize(object.serieDurationSecs,
            specifiedType: const FullType(int)));
    }
    if (object.restDurationSecs != null) {
      result
        ..add('restDurationSecs')
        ..add(serializers.serialize(object.restDurationSecs,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  ActivityDefinition deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityDefinitionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'numberOfSeries':
          result.numberOfSeries = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'manualStopSerie':
          result.manualStopSerie = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'serieDurationSecs':
          result.serieDurationSecs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'manualStopRest':
          result.manualStopRest = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'restDurationSecs':
          result.restDurationSecs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UniformWorkoutDefinitionSerializer
    implements StructuredSerializer<UniformWorkoutDefinition> {
  @override
  final Iterable<Type> types = const [
    UniformWorkoutDefinition,
    _$UniformWorkoutDefinition
  ];
  @override
  final String wireName = 'UniformWorkoutDefinition';

  @override
  Iterable serialize(Serializers serializers, UniformWorkoutDefinition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'warmupDurationSecs',
      serializers.serialize(object.warmupDurationSecs,
          specifiedType: const FullType(int)),
      'activityDefinition',
      serializers.serialize(object.activityDefinition,
          specifiedType: const FullType(ActivityDefinition)),
      'numberOfActivity',
      serializers.serialize(object.numberOfActivity,
          specifiedType: const FullType(int)),
      'interActivityRestDurationSec',
      serializers.serialize(object.interActivityRestDurationSec,
          specifiedType: const FullType(int)),
      'calldownDurationSecs',
      serializers.serialize(object.calldownDurationSecs,
          specifiedType: const FullType(int)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  UniformWorkoutDefinition deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UniformWorkoutDefinitionBuilder();

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
        case 'warmupDurationSecs':
          result.warmupDurationSecs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'activityDefinition':
          result.activityDefinition.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ActivityDefinition))
              as ActivityDefinition);
          break;
        case 'numberOfActivity':
          result.numberOfActivity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'interActivityRestDurationSec':
          result.interActivityRestDurationSec = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'calldownDurationSecs':
          result.calldownDurationSecs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityDefinition extends ActivityDefinition {
  @override
  final int numberOfSeries;
  @override
  final bool manualStopSerie;
  @override
  final int serieDurationSecs;
  @override
  final bool manualStopRest;
  @override
  final int restDurationSecs;

  factory _$ActivityDefinition([void updates(ActivityDefinitionBuilder b)]) =>
      (new ActivityDefinitionBuilder()..update(updates)).build();

  _$ActivityDefinition._(
      {this.numberOfSeries,
      this.manualStopSerie,
      this.serieDurationSecs,
      this.manualStopRest,
      this.restDurationSecs})
      : super._() {
    if (numberOfSeries == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinition', 'numberOfSeries');
    }
    if (manualStopSerie == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinition', 'manualStopSerie');
    }
    if (manualStopRest == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinition', 'manualStopRest');
    }
  }

  @override
  ActivityDefinition rebuild(void updates(ActivityDefinitionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityDefinitionBuilder toBuilder() =>
      new ActivityDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityDefinition &&
        numberOfSeries == other.numberOfSeries &&
        manualStopSerie == other.manualStopSerie &&
        serieDurationSecs == other.serieDurationSecs &&
        manualStopRest == other.manualStopRest &&
        restDurationSecs == other.restDurationSecs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, numberOfSeries.hashCode), manualStopSerie.hashCode),
                serieDurationSecs.hashCode),
            manualStopRest.hashCode),
        restDurationSecs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityDefinition')
          ..add('numberOfSeries', numberOfSeries)
          ..add('manualStopSerie', manualStopSerie)
          ..add('serieDurationSecs', serieDurationSecs)
          ..add('manualStopRest', manualStopRest)
          ..add('restDurationSecs', restDurationSecs))
        .toString();
  }
}

class ActivityDefinitionBuilder
    implements Builder<ActivityDefinition, ActivityDefinitionBuilder> {
  _$ActivityDefinition _$v;

  int _numberOfSeries;
  int get numberOfSeries => _$this._numberOfSeries;
  set numberOfSeries(int numberOfSeries) =>
      _$this._numberOfSeries = numberOfSeries;

  bool _manualStopSerie;
  bool get manualStopSerie => _$this._manualStopSerie;
  set manualStopSerie(bool manualStopSerie) =>
      _$this._manualStopSerie = manualStopSerie;

  int _serieDurationSecs;
  int get serieDurationSecs => _$this._serieDurationSecs;
  set serieDurationSecs(int serieDurationSecs) =>
      _$this._serieDurationSecs = serieDurationSecs;

  bool _manualStopRest;
  bool get manualStopRest => _$this._manualStopRest;
  set manualStopRest(bool manualStopRest) =>
      _$this._manualStopRest = manualStopRest;

  int _restDurationSecs;
  int get restDurationSecs => _$this._restDurationSecs;
  set restDurationSecs(int restDurationSecs) =>
      _$this._restDurationSecs = restDurationSecs;

  ActivityDefinitionBuilder();

  ActivityDefinitionBuilder get _$this {
    if (_$v != null) {
      _numberOfSeries = _$v.numberOfSeries;
      _manualStopSerie = _$v.manualStopSerie;
      _serieDurationSecs = _$v.serieDurationSecs;
      _manualStopRest = _$v.manualStopRest;
      _restDurationSecs = _$v.restDurationSecs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityDefinition other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityDefinition;
  }

  @override
  void update(void updates(ActivityDefinitionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityDefinition build() {
    final _$result = _$v ??
        new _$ActivityDefinition._(
            numberOfSeries: numberOfSeries,
            manualStopSerie: manualStopSerie,
            serieDurationSecs: serieDurationSecs,
            manualStopRest: manualStopRest,
            restDurationSecs: restDurationSecs);
    replace(_$result);
    return _$result;
  }
}

class _$UniformWorkoutDefinition extends UniformWorkoutDefinition {
  @override
  final String id;
  @override
  final int warmupDurationSecs;
  @override
  final ActivityDefinition activityDefinition;
  @override
  final int numberOfActivity;
  @override
  final int interActivityRestDurationSec;
  @override
  final int calldownDurationSecs;

  factory _$UniformWorkoutDefinition(
          [void updates(UniformWorkoutDefinitionBuilder b)]) =>
      (new UniformWorkoutDefinitionBuilder()..update(updates)).build();

  _$UniformWorkoutDefinition._(
      {this.id,
      this.warmupDurationSecs,
      this.activityDefinition,
      this.numberOfActivity,
      this.interActivityRestDurationSec,
      this.calldownDurationSecs})
      : super._() {
    if (warmupDurationSecs == null) {
      throw new BuiltValueNullFieldError(
          'UniformWorkoutDefinition', 'warmupDurationSecs');
    }
    if (activityDefinition == null) {
      throw new BuiltValueNullFieldError(
          'UniformWorkoutDefinition', 'activityDefinition');
    }
    if (numberOfActivity == null) {
      throw new BuiltValueNullFieldError(
          'UniformWorkoutDefinition', 'numberOfActivity');
    }
    if (interActivityRestDurationSec == null) {
      throw new BuiltValueNullFieldError(
          'UniformWorkoutDefinition', 'interActivityRestDurationSec');
    }
    if (calldownDurationSecs == null) {
      throw new BuiltValueNullFieldError(
          'UniformWorkoutDefinition', 'calldownDurationSecs');
    }
  }

  @override
  UniformWorkoutDefinition rebuild(
          void updates(UniformWorkoutDefinitionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UniformWorkoutDefinitionBuilder toBuilder() =>
      new UniformWorkoutDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniformWorkoutDefinition &&
        id == other.id &&
        warmupDurationSecs == other.warmupDurationSecs &&
        activityDefinition == other.activityDefinition &&
        numberOfActivity == other.numberOfActivity &&
        interActivityRestDurationSec == other.interActivityRestDurationSec &&
        calldownDurationSecs == other.calldownDurationSecs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), warmupDurationSecs.hashCode),
                    activityDefinition.hashCode),
                numberOfActivity.hashCode),
            interActivityRestDurationSec.hashCode),
        calldownDurationSecs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UniformWorkoutDefinition')
          ..add('id', id)
          ..add('warmupDurationSecs', warmupDurationSecs)
          ..add('activityDefinition', activityDefinition)
          ..add('numberOfActivity', numberOfActivity)
          ..add('interActivityRestDurationSec', interActivityRestDurationSec)
          ..add('calldownDurationSecs', calldownDurationSecs))
        .toString();
  }
}

class UniformWorkoutDefinitionBuilder
    implements
        Builder<UniformWorkoutDefinition, UniformWorkoutDefinitionBuilder> {
  _$UniformWorkoutDefinition _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _warmupDurationSecs;
  int get warmupDurationSecs => _$this._warmupDurationSecs;
  set warmupDurationSecs(int warmupDurationSecs) =>
      _$this._warmupDurationSecs = warmupDurationSecs;

  ActivityDefinitionBuilder _activityDefinition;
  ActivityDefinitionBuilder get activityDefinition =>
      _$this._activityDefinition ??= new ActivityDefinitionBuilder();
  set activityDefinition(ActivityDefinitionBuilder activityDefinition) =>
      _$this._activityDefinition = activityDefinition;

  int _numberOfActivity;
  int get numberOfActivity => _$this._numberOfActivity;
  set numberOfActivity(int numberOfActivity) =>
      _$this._numberOfActivity = numberOfActivity;

  int _interActivityRestDurationSec;
  int get interActivityRestDurationSec => _$this._interActivityRestDurationSec;
  set interActivityRestDurationSec(int interActivityRestDurationSec) =>
      _$this._interActivityRestDurationSec = interActivityRestDurationSec;

  int _calldownDurationSecs;
  int get calldownDurationSecs => _$this._calldownDurationSecs;
  set calldownDurationSecs(int calldownDurationSecs) =>
      _$this._calldownDurationSecs = calldownDurationSecs;

  UniformWorkoutDefinitionBuilder();

  UniformWorkoutDefinitionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _warmupDurationSecs = _$v.warmupDurationSecs;
      _activityDefinition = _$v.activityDefinition?.toBuilder();
      _numberOfActivity = _$v.numberOfActivity;
      _interActivityRestDurationSec = _$v.interActivityRestDurationSec;
      _calldownDurationSecs = _$v.calldownDurationSecs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniformWorkoutDefinition other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UniformWorkoutDefinition;
  }

  @override
  void update(void updates(UniformWorkoutDefinitionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UniformWorkoutDefinition build() {
    _$UniformWorkoutDefinition _$result;
    try {
      _$result = _$v ??
          new _$UniformWorkoutDefinition._(
              id: id,
              warmupDurationSecs: warmupDurationSecs,
              activityDefinition: activityDefinition.build(),
              numberOfActivity: numberOfActivity,
              interActivityRestDurationSec: interActivityRestDurationSec,
              calldownDurationSecs: calldownDurationSecs);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activityDefinition';
        activityDefinition.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UniformWorkoutDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
