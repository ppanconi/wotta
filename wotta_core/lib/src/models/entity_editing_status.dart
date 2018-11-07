
library entity_editing_status;

import 'package:built_value/built_value.dart';
import 'package:wotta_core/src/models/domain/entity.dart';

part 'entity_editing_status.g.dart';

abstract class EntityEditingStatus implements Built<EntityEditingStatus, EntityEditingStatusBuilder> {

  EntityEditingStatus._();

  bool get inputIsValid;

  Entity get entity;

  factory EntityEditingStatus([void updates(EntityEditingStatusBuilder b)]) = _$EntityEditingStatus;

  bool entityIsSaved() {
    return entity.isSaved();
  }
}