import 'package:wotta_core/wotta_core.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Workout workout;


    setUp(() {
      workout = new Workout((b) => b
        ..title = 'Test Workout'
        ..id = 'testId');
    });



    test('Todo', () {
      expect(workout.title, 'Test Workout');
    });

    test('Todo not save', () {
      final notSaved  = workout.rebuild((b) => b.id = null);
      expect(notSaved.isSaved(), false);
    });

  });
}
