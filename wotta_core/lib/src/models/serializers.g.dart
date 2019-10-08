// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ActivityDefinition.serializer)
      ..add(ActivityDefinitionSequenceItem.serializer)
      ..add(ActivityUniformDefinition.serializer)
      ..add(ActivityWork.serializer)
      ..add(Executor.serializer)
      ..add(InnerWorkoutExecution.serializer)
      ..add(InnerWorkoutExecutionItem.serializer)
      ..add(UniformWorkoutDefinition.serializer)
      ..add(Workout.serializer)
      ..add(WorkoutDefinition.serializer)
      ..add(WorkoutExecutionItemType.serializer)
      ..add(WottaAppState.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ActivityDefinitionSequenceItem)]),
          () => new ListBuilder<ActivityDefinitionSequenceItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ActivityWork)]),
          () => new ListBuilder<ActivityWork>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(InnerWorkoutExecutionItem)]),
          () => new ListBuilder<InnerWorkoutExecutionItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Workout)]),
          () => new ListBuilder<Workout>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WorkoutExecution)]),
          () => new ListBuilder<WorkoutExecution>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
