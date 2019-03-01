// GENERATED CODE - DO NOT MODIFY BY HAND

part of workout_definition;

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

Serializer<WorkoutDefinition> _$workoutDefinitionSerializer =
    new _$WorkoutDefinitionSerializer();
Serializer<ActivityDefinitionSequenceItem>
    _$activityDefinitionSequenceItemSerializer =
    new _$ActivityDefinitionSequenceItemSerializer();
Serializer<ActivityDefinition> _$activityDefinitionSerializer =
    new _$ActivityDefinitionSerializer();
Serializer<ActivityWork> _$activityWorkSerializer =
    new _$ActivityWorkSerializer();

class _$WorkoutDefinitionSerializer
    implements StructuredSerializer<WorkoutDefinition> {
  @override
  final Iterable<Type> types = const [WorkoutDefinition, _$WorkoutDefinition];
  @override
  final String wireName = 'WorkoutDefinition';

  @override
  Iterable serialize(Serializers serializers, WorkoutDefinition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activityDefinitionSequence',
      serializers.serialize(object.activityDefinitionSequence,
          specifiedType: const FullType(BuiltList,
              const [const FullType(ActivityDefinitionSequenceItem)])),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.warmup != null) {
      result
        ..add('warmup')
        ..add(serializers.serialize(object.warmup,
            specifiedType: const FullType(ActivityWork)));
    }
    if (object.cooldown != null) {
      result
        ..add('cooldown')
        ..add(serializers.serialize(object.cooldown,
            specifiedType: const FullType(ActivityWork)));
    }

    return result;
  }

  @override
  WorkoutDefinition deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkoutDefinitionBuilder();

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
        case 'warmup':
          result.warmup.replace(serializers.deserialize(value,
              specifiedType: const FullType(ActivityWork)) as ActivityWork);
          break;
        case 'activityDefinitionSequence':
          result.activityDefinitionSequence.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ActivityDefinitionSequenceItem)
              ])) as BuiltList);
          break;
        case 'cooldown':
          result.cooldown.replace(serializers.deserialize(value,
              specifiedType: const FullType(ActivityWork)) as ActivityWork);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityDefinitionSequenceItemSerializer
    implements StructuredSerializer<ActivityDefinitionSequenceItem> {
  @override
  final Iterable<Type> types = const [
    ActivityDefinitionSequenceItem,
    _$ActivityDefinitionSequenceItem
  ];
  @override
  final String wireName = 'ActivityDefinitionSequenceItem';

  @override
  Iterable serialize(
      Serializers serializers, ActivityDefinitionSequenceItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activityDefinition',
      serializers.serialize(object.activityDefinition,
          specifiedType: const FullType(ActivityDefinition)),
      'restBetweenActivity',
      serializers.serialize(object.restBetweenActivity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ActivityDefinitionSequenceItem deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityDefinitionSequenceItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activityDefinition':
          result.activityDefinition.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ActivityDefinition))
              as ActivityDefinition);
          break;
        case 'restBetweenActivity':
          result.restBetweenActivity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

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
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'activityWorkSequence',
      serializers.serialize(object.activityWorkSequence,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ActivityWork)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.icon != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(object.icon,
            specifiedType: const FullType(String)));
    }
    if (object.video != null) {
      result
        ..add('video')
        ..add(serializers.serialize(object.video,
            specifiedType: const FullType(String)));
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activityWorkSequence':
          result.activityWorkSequence.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ActivityWork)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityWorkSerializer implements StructuredSerializer<ActivityWork> {
  @override
  final Iterable<Type> types = const [ActivityWork, _$ActivityWork];
  @override
  final String wireName = 'ActivityWork';

  @override
  Iterable serialize(Serializers serializers, ActivityWork object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activityWorkIndex',
      serializers.serialize(object.activityWorkIndex,
          specifiedType: const FullType(int)),
      'manualWorkStop',
      serializers.serialize(object.manualWorkStop,
          specifiedType: const FullType(bool)),
      'manualRestStop',
      serializers.serialize(object.manualRestStop,
          specifiedType: const FullType(bool)),
    ];
    if (object.numberOfRepetitions != null) {
      result
        ..add('numberOfRepetitions')
        ..add(serializers.serialize(object.numberOfRepetitions,
            specifiedType: const FullType(int)));
    }
    if (object.workDurationSecs != null) {
      result
        ..add('workDurationSecs')
        ..add(serializers.serialize(object.workDurationSecs,
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
  ActivityWork deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityWorkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activityWorkIndex':
          result.activityWorkIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'numberOfRepetitions':
          result.numberOfRepetitions = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'manualWorkStop':
          result.manualWorkStop = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'workDurationSecs':
          result.workDurationSecs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'manualRestStop':
          result.manualRestStop = serializers.deserialize(value,
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

class _$WorkoutDefinition extends WorkoutDefinition {
  @override
  final String id;
  @override
  final ActivityWork warmup;
  @override
  final BuiltList<ActivityDefinitionSequenceItem> activityDefinitionSequence;
  @override
  final ActivityWork cooldown;

  factory _$WorkoutDefinition([void updates(WorkoutDefinitionBuilder b)]) =>
      (new WorkoutDefinitionBuilder()..update(updates)).build();

  _$WorkoutDefinition._(
      {this.id, this.warmup, this.activityDefinitionSequence, this.cooldown})
      : super._() {
    if (activityDefinitionSequence == null) {
      throw new BuiltValueNullFieldError(
          'WorkoutDefinition', 'activityDefinitionSequence');
    }
  }

  @override
  WorkoutDefinition rebuild(void updates(WorkoutDefinitionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkoutDefinitionBuilder toBuilder() =>
      new WorkoutDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkoutDefinition &&
        id == other.id &&
        warmup == other.warmup &&
        activityDefinitionSequence == other.activityDefinitionSequence &&
        cooldown == other.cooldown;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), warmup.hashCode),
            activityDefinitionSequence.hashCode),
        cooldown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WorkoutDefinition')
          ..add('id', id)
          ..add('warmup', warmup)
          ..add('activityDefinitionSequence', activityDefinitionSequence)
          ..add('cooldown', cooldown))
        .toString();
  }
}

class WorkoutDefinitionBuilder
    implements Builder<WorkoutDefinition, WorkoutDefinitionBuilder> {
  _$WorkoutDefinition _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  ActivityWorkBuilder _warmup;
  ActivityWorkBuilder get warmup =>
      _$this._warmup ??= new ActivityWorkBuilder();
  set warmup(ActivityWorkBuilder warmup) => _$this._warmup = warmup;

  ListBuilder<ActivityDefinitionSequenceItem> _activityDefinitionSequence;
  ListBuilder<ActivityDefinitionSequenceItem> get activityDefinitionSequence =>
      _$this._activityDefinitionSequence ??=
          new ListBuilder<ActivityDefinitionSequenceItem>();
  set activityDefinitionSequence(
          ListBuilder<ActivityDefinitionSequenceItem>
              activityDefinitionSequence) =>
      _$this._activityDefinitionSequence = activityDefinitionSequence;

  ActivityWorkBuilder _cooldown;
  ActivityWorkBuilder get cooldown =>
      _$this._cooldown ??= new ActivityWorkBuilder();
  set cooldown(ActivityWorkBuilder cooldown) => _$this._cooldown = cooldown;

  WorkoutDefinitionBuilder();

  WorkoutDefinitionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _warmup = _$v.warmup?.toBuilder();
      _activityDefinitionSequence = _$v.activityDefinitionSequence?.toBuilder();
      _cooldown = _$v.cooldown?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkoutDefinition other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WorkoutDefinition;
  }

  @override
  void update(void updates(WorkoutDefinitionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$WorkoutDefinition build() {
    _$WorkoutDefinition _$result;
    try {
      _$result = _$v ??
          new _$WorkoutDefinition._(
              id: id,
              warmup: _warmup?.build(),
              activityDefinitionSequence: activityDefinitionSequence.build(),
              cooldown: _cooldown?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'warmup';
        _warmup?.build();
        _$failedField = 'activityDefinitionSequence';
        activityDefinitionSequence.build();
        _$failedField = 'cooldown';
        _cooldown?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WorkoutDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ActivityDefinitionSequenceItem extends ActivityDefinitionSequenceItem {
  @override
  final ActivityDefinition activityDefinition;
  @override
  final int restBetweenActivity;

  factory _$ActivityDefinitionSequenceItem(
          [void updates(ActivityDefinitionSequenceItemBuilder b)]) =>
      (new ActivityDefinitionSequenceItemBuilder()..update(updates)).build();

  _$ActivityDefinitionSequenceItem._(
      {this.activityDefinition, this.restBetweenActivity})
      : super._() {
    if (activityDefinition == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinitionSequenceItem', 'activityDefinition');
    }
    if (restBetweenActivity == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinitionSequenceItem', 'restBetweenActivity');
    }
  }

  @override
  ActivityDefinitionSequenceItem rebuild(
          void updates(ActivityDefinitionSequenceItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityDefinitionSequenceItemBuilder toBuilder() =>
      new ActivityDefinitionSequenceItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityDefinitionSequenceItem &&
        activityDefinition == other.activityDefinition &&
        restBetweenActivity == other.restBetweenActivity;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, activityDefinition.hashCode), restBetweenActivity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityDefinitionSequenceItem')
          ..add('activityDefinition', activityDefinition)
          ..add('restBetweenActivity', restBetweenActivity))
        .toString();
  }
}

class ActivityDefinitionSequenceItemBuilder
    implements
        Builder<ActivityDefinitionSequenceItem,
            ActivityDefinitionSequenceItemBuilder> {
  _$ActivityDefinitionSequenceItem _$v;

  ActivityDefinitionBuilder _activityDefinition;
  ActivityDefinitionBuilder get activityDefinition =>
      _$this._activityDefinition ??= new ActivityDefinitionBuilder();
  set activityDefinition(ActivityDefinitionBuilder activityDefinition) =>
      _$this._activityDefinition = activityDefinition;

  int _restBetweenActivity;
  int get restBetweenActivity => _$this._restBetweenActivity;
  set restBetweenActivity(int restBetweenActivity) =>
      _$this._restBetweenActivity = restBetweenActivity;

  ActivityDefinitionSequenceItemBuilder();

  ActivityDefinitionSequenceItemBuilder get _$this {
    if (_$v != null) {
      _activityDefinition = _$v.activityDefinition?.toBuilder();
      _restBetweenActivity = _$v.restBetweenActivity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityDefinitionSequenceItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityDefinitionSequenceItem;
  }

  @override
  void update(void updates(ActivityDefinitionSequenceItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityDefinitionSequenceItem build() {
    _$ActivityDefinitionSequenceItem _$result;
    try {
      _$result = _$v ??
          new _$ActivityDefinitionSequenceItem._(
              activityDefinition: activityDefinition.build(),
              restBetweenActivity: restBetweenActivity);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activityDefinition';
        activityDefinition.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ActivityDefinitionSequenceItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ActivityDefinition extends ActivityDefinition {
  @override
  final String name;
  @override
  final String description;
  @override
  final String icon;
  @override
  final String video;
  @override
  final BuiltList<ActivityWork> activityWorkSequence;

  factory _$ActivityDefinition([void updates(ActivityDefinitionBuilder b)]) =>
      (new ActivityDefinitionBuilder()..update(updates)).build();

  _$ActivityDefinition._(
      {this.name,
      this.description,
      this.icon,
      this.video,
      this.activityWorkSequence})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ActivityDefinition', 'name');
    }
    if (activityWorkSequence == null) {
      throw new BuiltValueNullFieldError(
          'ActivityDefinition', 'activityWorkSequence');
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
        name == other.name &&
        description == other.description &&
        icon == other.icon &&
        video == other.video &&
        activityWorkSequence == other.activityWorkSequence;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), description.hashCode),
                icon.hashCode),
            video.hashCode),
        activityWorkSequence.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityDefinition')
          ..add('name', name)
          ..add('description', description)
          ..add('icon', icon)
          ..add('video', video)
          ..add('activityWorkSequence', activityWorkSequence))
        .toString();
  }
}

class ActivityDefinitionBuilder
    implements Builder<ActivityDefinition, ActivityDefinitionBuilder> {
  _$ActivityDefinition _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  String _video;
  String get video => _$this._video;
  set video(String video) => _$this._video = video;

  ListBuilder<ActivityWork> _activityWorkSequence;
  ListBuilder<ActivityWork> get activityWorkSequence =>
      _$this._activityWorkSequence ??= new ListBuilder<ActivityWork>();
  set activityWorkSequence(ListBuilder<ActivityWork> activityWorkSequence) =>
      _$this._activityWorkSequence = activityWorkSequence;

  ActivityDefinitionBuilder();

  ActivityDefinitionBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _icon = _$v.icon;
      _video = _$v.video;
      _activityWorkSequence = _$v.activityWorkSequence?.toBuilder();
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
    _$ActivityDefinition _$result;
    try {
      _$result = _$v ??
          new _$ActivityDefinition._(
              name: name,
              description: description,
              icon: icon,
              video: video,
              activityWorkSequence: activityWorkSequence.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activityWorkSequence';
        activityWorkSequence.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ActivityDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ActivityWork extends ActivityWork {
  @override
  final int activityWorkIndex;
  @override
  final int numberOfRepetitions;
  @override
  final bool manualWorkStop;
  @override
  final int workDurationSecs;
  @override
  final bool manualRestStop;
  @override
  final int restDurationSecs;

  factory _$ActivityWork([void updates(ActivityWorkBuilder b)]) =>
      (new ActivityWorkBuilder()..update(updates)).build();

  _$ActivityWork._(
      {this.activityWorkIndex,
      this.numberOfRepetitions,
      this.manualWorkStop,
      this.workDurationSecs,
      this.manualRestStop,
      this.restDurationSecs})
      : super._() {
    if (activityWorkIndex == null) {
      throw new BuiltValueNullFieldError('ActivityWork', 'activityWorkIndex');
    }
    if (manualWorkStop == null) {
      throw new BuiltValueNullFieldError('ActivityWork', 'manualWorkStop');
    }
    if (manualRestStop == null) {
      throw new BuiltValueNullFieldError('ActivityWork', 'manualRestStop');
    }
  }

  @override
  ActivityWork rebuild(void updates(ActivityWorkBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityWorkBuilder toBuilder() => new ActivityWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityWork &&
        activityWorkIndex == other.activityWorkIndex &&
        numberOfRepetitions == other.numberOfRepetitions &&
        manualWorkStop == other.manualWorkStop &&
        workDurationSecs == other.workDurationSecs &&
        manualRestStop == other.manualRestStop &&
        restDurationSecs == other.restDurationSecs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, activityWorkIndex.hashCode),
                        numberOfRepetitions.hashCode),
                    manualWorkStop.hashCode),
                workDurationSecs.hashCode),
            manualRestStop.hashCode),
        restDurationSecs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityWork')
          ..add('activityWorkIndex', activityWorkIndex)
          ..add('numberOfRepetitions', numberOfRepetitions)
          ..add('manualWorkStop', manualWorkStop)
          ..add('workDurationSecs', workDurationSecs)
          ..add('manualRestStop', manualRestStop)
          ..add('restDurationSecs', restDurationSecs))
        .toString();
  }
}

class ActivityWorkBuilder
    implements Builder<ActivityWork, ActivityWorkBuilder> {
  _$ActivityWork _$v;

  int _activityWorkIndex;
  int get activityWorkIndex => _$this._activityWorkIndex;
  set activityWorkIndex(int activityWorkIndex) =>
      _$this._activityWorkIndex = activityWorkIndex;

  int _numberOfRepetitions;
  int get numberOfRepetitions => _$this._numberOfRepetitions;
  set numberOfRepetitions(int numberOfRepetitions) =>
      _$this._numberOfRepetitions = numberOfRepetitions;

  bool _manualWorkStop;
  bool get manualWorkStop => _$this._manualWorkStop;
  set manualWorkStop(bool manualWorkStop) =>
      _$this._manualWorkStop = manualWorkStop;

  int _workDurationSecs;
  int get workDurationSecs => _$this._workDurationSecs;
  set workDurationSecs(int workDurationSecs) =>
      _$this._workDurationSecs = workDurationSecs;

  bool _manualRestStop;
  bool get manualRestStop => _$this._manualRestStop;
  set manualRestStop(bool manualRestStop) =>
      _$this._manualRestStop = manualRestStop;

  int _restDurationSecs;
  int get restDurationSecs => _$this._restDurationSecs;
  set restDurationSecs(int restDurationSecs) =>
      _$this._restDurationSecs = restDurationSecs;

  ActivityWorkBuilder();

  ActivityWorkBuilder get _$this {
    if (_$v != null) {
      _activityWorkIndex = _$v.activityWorkIndex;
      _numberOfRepetitions = _$v.numberOfRepetitions;
      _manualWorkStop = _$v.manualWorkStop;
      _workDurationSecs = _$v.workDurationSecs;
      _manualRestStop = _$v.manualRestStop;
      _restDurationSecs = _$v.restDurationSecs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityWork other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityWork;
  }

  @override
  void update(void updates(ActivityWorkBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityWork build() {
    final _$result = _$v ??
        new _$ActivityWork._(
            activityWorkIndex: activityWorkIndex,
            numberOfRepetitions: numberOfRepetitions,
            manualWorkStop: manualWorkStop,
            workDurationSecs: workDurationSecs,
            manualRestStop: manualRestStop,
            restDurationSecs: restDurationSecs);
    replace(_$result);
    return _$result;
  }
}
