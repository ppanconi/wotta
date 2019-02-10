import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/connectors/workouts_connector.dart';
import 'package:wotta_flutter/presentation/execution.dart';
import 'package:wotta_flutter/presentation/workout.dart';

class WottaRoutes {
  static final home = "/";
  static final addWorkout = "/addWorkout";
  static final startWorkout = "/startWorkout";

  static final Map<String, WidgetBuilder> routes =  {

    home: (context) { return WorkoutsView(); },

    addWorkout: (context) {
      return StoreConnection<WottaAppState, WottaActions, Null> (
          builder: (context, Null, actions) {
            actions.createNewWorkoutAction();
            return new AddWorkoutConnector();
          },
          connect: (state) => null
      );
    },

    startWorkout: (contexr) {
      return ExecutionView();
    }
  };
}
