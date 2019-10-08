// GENERATED CODE - DO NOT MODIFY BY HAND

part of entity_editing_status;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EntityEditingStatus extends EntityEditingStatus {
  @override
  final bool inputIsValid;
  @override
  final Entity entity;

  factory _$EntityEditingStatus(
          [void Function(EntityEditingStatusBuilder) updates]) =>
      (new EntityEditingStatusBuilder()..update(updates)).build();

  _$EntityEditingStatus._({this.inputIsValid, this.entity}) : super._() {
    if (inputIsValid == null) {
      throw new BuiltValueNullFieldError('EntityEditingStatus', 'inputIsValid');
    }
    if (entity == null) {
      throw new BuiltValueNullFieldError('EntityEditingStatus', 'entity');
    }
  }

  @override
  EntityEditingStatus rebuild(
          void Function(EntityEditingStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntityEditingStatusBuilder toBuilder() =>
      new EntityEditingStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntityEditingStatus &&
        inputIsValid == other.inputIsValid &&
        entity == other.entity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, inputIsValid.hashCode), entity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntityEditingStatus')
          ..add('inputIsValid', inputIsValid)
          ..add('entity', entity))
        .toString();
  }
}

class EntityEditingStatusBuilder
    implements Builder<EntityEditingStatus, EntityEditingStatusBuilder> {
  _$EntityEditingStatus _$v;

  bool _inputIsValid;
  bool get inputIsValid => _$this._inputIsValid;
  set inputIsValid(bool inputIsValid) => _$this._inputIsValid = inputIsValid;

  Entity _entity;
  Entity get entity => _$this._entity;
  set entity(Entity entity) => _$this._entity = entity;

  EntityEditingStatusBuilder();

  EntityEditingStatusBuilder get _$this {
    if (_$v != null) {
      _inputIsValid = _$v.inputIsValid;
      _entity = _$v.entity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntityEditingStatus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntityEditingStatus;
  }

  @override
  void update(void Function(EntityEditingStatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntityEditingStatus build() {
    final _$result = _$v ??
        new _$EntityEditingStatus._(inputIsValid: inputIsValid, entity: entity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
