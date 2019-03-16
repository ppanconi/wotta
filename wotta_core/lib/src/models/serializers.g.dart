// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

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
