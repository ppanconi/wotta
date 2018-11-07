import 'package:test/test.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:built_redux/built_redux.dart';


main() {
  group('Empty State reducer test', () {
    Workout workout;
    Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

    setUp(() {
      store = new Store(wottaReducerBuilder.build(), WottaAppState(), WottaActions());
    });

    tearDown(() {
      store.dispose();
    });


    test('Add Workout test', () {
      workout = Workout((b) => b
          ..title = 'testWorkout'
          ..notes = 'Some test notes');

      expect(store.state.workouts.isEmpty, true);
      store.actions.addWorkoutAction(workout);
      expect(store.state.workouts.length, 1);
      expect(store.state.workouts, [workout.rebuild((b) => b.id = store.state.workouts[0].id)]);
      expect(store.state.status, 0);

    });
  });

  group('One element State reducer test', () {
    Workout workout;
    Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

    setUp(() {
      store = new Store(wottaReducerBuilder.build(), WottaAppState(), WottaActions());
      workout = Workout((b) => b
        ..title = 'testWorkout'
        ..notes = 'Some test notes');

      expect(store.state.workouts.isEmpty, true);
      store.actions.addWorkoutAction(workout);
      expect(store.state.workouts.length, 1);
    });

    tearDown(() {
      store.dispose();
    });


    test('Delete Workout test', () {
      store.actions.deleteWorkoutAction(store.state.workouts[0].id);
      expect(store.state.workouts.isEmpty, true);
    });

    test('Seve Workout test', () {
      final added = store.state.workouts.elementAt(0);
      final updated = added.rebuild((b) => b.title = "updated");
      store.actions.saveWorkoutAction(updated);
      expect(store.state.workouts.elementAt(0) , isNot(equals(added)));
      expect(store.state.workouts, [updated]);
    });
  });

}