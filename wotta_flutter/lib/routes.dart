import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/connectors/execution_connector.dart';
import 'package:wotta_flutter/connectors/workouts_connector.dart';
import 'package:wotta_flutter/presentation/execution.dart';
import 'package:wotta_flutter/presentation/home.dart';
import 'package:wotta_flutter/presentation/workout.dart';

class WottaRoutes {
  static final home = "/";
  static final addWorkout = "/addWorkout";
  static final startWorkout = "/startWorkout";

  static final Map<String, WidgetBuilder> routes =  {

    home: (context) { return  WottaHomePage();},

    addWorkout: (context) {
      return StoreConnection<WottaAppState, WottaActions, Null> (
          builder: (context, Null, actions) {
            actions.createNewWorkoutAction();
            return new AddWorkoutConnector();
          },
          connect: (state) => null
      );
    },

    startWorkout: (context) {
      return StoreConnection<WottaAppState, WottaActions, Null> (
          builder: (context, Null, actions) {
            actions.startWorkoutExecution();
            return new StartWorkoutConnector();
          },
          connect: (state) => null
      );
    }
  };
}
