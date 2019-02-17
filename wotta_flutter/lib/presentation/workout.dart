
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/connectors/entity_form_connector.dart';
import 'package:wotta_flutter/connectors/execution_connector.dart';
import 'package:wotta_flutter/connectors/workouts_connector.dart';
import 'package:wotta_flutter/keys.dart';
import 'package:wotta_flutter/presentation/commons.dart';
import 'package:wotta_flutter/routes.dart';

class WorkoutsView extends StatelessWidget {
  WorkoutsView() : super(key: WottaKeys.workoutWiev);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      body: WorkoutsConnetor(),
      floatingActionButton: FloatingActionButton(
        key: WottaKeys.addWorkoutFab,
        onPressed: () {
          Navigator.pushNamed(context, WottaRoutes.addWorkout);
        },
        child: Icon(Icons.add),
        tooltip: 'Add Workout',
      ),
    );
  }
}

class WorkoutList extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 20.0);
  final _smallFont = const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

  final BuiltList<Workout> workouts;
  final Function(Workout) onRemove;
  final Function(Workout) onUndoRemove;

  WorkoutList({@required this.workouts, this.onRemove, this.onUndoRemove})
      : super(key: WottaKeys.workoutList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // The itemBuilder callback is called once per suggested word pairing,
      // and places each suggestion into a ListTile row.
      // For even rows, the function adds a ListTile row for the word pairing.
      // For odd rows, the function adds a Divider widget to visually
      // separate the entries. Note that the divider may be difficult
      // to see on smaller devices.
      itemBuilder: (context, i) {
        // Add a one-pixel-high divider widget before each row in theListView.
        if (i.isOdd) return Divider();

        // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings in the ListView,
        // minus the divider widgets.
        final index = i ~/ 2;

        return InkWell(
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return EditWorkoutConnector(workouts[index]);
                    },
                  ),
                ),
            child: Dismissible(
              key: GlobalKey(),
              onDismissed: (direction) {
                _removeWorkout(context, workouts[index]);
              },
              child: _buildRow(context, workouts[index]),
            ));
      },
      itemCount: workouts.length * 2,
    );
  }

  void _removeWorkout(BuildContext context, Workout workout) {
    onRemove(workout);

    Scaffold.of(context).showSnackBar(SnackBar(
        key: WottaKeys.snackbar,
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).backgroundColor,
        content: Text(
          'Deleted $workout.title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        action: SnackBarAction(
          label: 'Undo delation',
          onPressed: () => onUndoRemove(workout),
        )));
  }

  Widget _buildRow(BuildContext context, Workout workout) {
    return ListTile(
      title: Text(
        workout.title,
        style: _biggerFont,
      ),
      subtitle: Text(workout.notes, style: _smallFont, overflow: TextOverflow.ellipsis),
      trailing: FlatButton(
          onPressed: () {

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return StoreConnection<WottaAppState, WottaActions, Null> (
                      builder: (context, Null, actions) {
                        actions.startWorkoutExecution(workout);
                        return new StartWorkoutConnector();
                      },
                      connect: (state) => null
                  );
                },
              ),
            );
//            Navigator.push(context,  WottaRoutes.startWorkout);
          },
          child: Icon(Icons.play_circle_outline,
                color: Colors.red
          )
      ),
    );
  }
}

typedef OnConfirmWorkout = Function(Workout workout);

class WorkoutDetailView extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final GlobalKey<FormFieldState<String>> _titleKey =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _warmupDurattionKey =
    GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _cooldownDurattionKey =
    GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _numberOfActivityKey =
    GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _interActivityRestDurationKey =
    GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _noteKey =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _numberOfSeries =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<OptionValueFormFieldState> _serieDuration = GlobalKey<OptionValueFormFieldState>();

  static final GlobalKey<OptionValueFormFieldState> _restDuration = GlobalKey<OptionValueFormFieldState>();

  final Workout workout;
  final OnConfirmWorkout confirmCallback;


  WorkoutDetailView(
      {@required Key key,
      @required this.workout,
      @required this.confirmCallback})
      : assert(workout != null), super(key: key);

  bool _isEditing() => workout.isSaved();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StoreConnection<WottaAppState, WottaActions, Null>(
        builder: (context, Null, actions) {
          /*
            initialize EntityEditingStatus before build form
           */
          actions.updateEntityEditingStatus(EntityEditingStatus((b) => b
            ..entity = workout
            ..inputIsValid = workout.isSaved()));

          return EntityFormConnector(
            formKey: _formKey,
            formBody: ListView(
              children: [
                TextFormField(
                  initialValue: workout.title,
                  key: _titleKey,
                  autofocus: !_isEditing(),
                  style: textTheme.headline,
                  decoration: InputDecoration(
                    hintText: 'Add workout title',
                  ),
                  validator: (val) {
                    return val.trim().isEmpty
                        ? 'Please enter same text for the title'
                        : null;
                  },
                ),

                Row(children: <Widget>[
                  Expanded(child: TextFormField(
                    initialValue: workout.uniformWorkoutDefinition.warmupDurationSecs
                        .toString(),
                    key: _warmupDurattionKey,
                    decoration: InputDecoration(labelText: "Warmup Duration (s)"),
                    validator: (val) {
                      final parsed = int.tryParse(val) ?? (-1);
                      return parsed < 0
                          ? "Non negative number is required"
                          : null;
                    },
                  )),
                  Expanded(child: TextFormField(
                    initialValue: workout.uniformWorkoutDefinition.calldownDurationSecs
                        .toString(),
                    key: _cooldownDurattionKey,
                    decoration: InputDecoration(labelText: "Cooldown Duration (s)"),
                    validator: (val) {
                      final parsed = int.tryParse(val) ?? (-1);
                      return parsed < 0
                          ? "Non negative number is required"
                          : null;
                    },
                  )),
                ]),

                Row(children: <Widget>[
                  Expanded(child: TextFormField(
                    initialValue: workout.uniformWorkoutDefinition.numberOfActivity.toString(),
                    key: _numberOfActivityKey,
                    decoration: InputDecoration(labelText: "Number of Activities"),
                    validator: (val) {
                      final parsed = int.tryParse(val) ?? (-1);
                      return parsed < 0
                          ? "Non negative number is required"
                          : null;
                    },
                  )),
                  Expanded(child: TextFormField(
                    initialValue: workout.uniformWorkoutDefinition.interActivityRestDurationSec.toString(),
                    key: _interActivityRestDurationKey,
                    decoration: InputDecoration(labelText: "Inter Acticity Rest (s)"),
                    validator: (val) {
                      final parsed = int.tryParse(val) ?? (-1);
                      return parsed < 0
                          ? "Non negative number is required"
                          : null;
                    },
                  )),
                ]),

                TextFormField(
                  initialValue: workout.uniformWorkoutDefinition
                      .activityDefinition.numberOfSeries
                      .toString(),
                  key: _numberOfSeries,
                  decoration: InputDecoration(labelText: "Number of Series:"),
                  validator: (val) {
                    final parsed = int.tryParse(val) ?? (-1);
                    return parsed < 0
                        ? "Non negative number is required"
                        : null;
                  },
                ),
                OptionValueFormField(
                  key: _serieDuration,
                  isIntialCheck: workout.uniformWorkoutDefinition.activityDefinition.manualStopSerie,
                  initialValue: workout.uniformWorkoutDefinition.activityDefinition.serieDurationSecs?.toString() ?? "30",
                  labelForValue: "Work Duration (s)",
                  textWhenChecked: "Manually stop work",
                  valueValidator: (val) {
                        final parsed = int.tryParse(val) ?? (-1);
                        return parsed < 0
                            ? "Non negative number is required"
                            : null;
                      },
                ),
                OptionValueFormField(
                  key: _restDuration,
                  isIntialCheck: workout.uniformWorkoutDefinition.activityDefinition.manualStopRest,
                  initialValue: workout.uniformWorkoutDefinition.activityDefinition.restDurationSecs?.toString() ?? "45",
                  labelForValue: "Rest Duration (s)",
                  textWhenChecked: "Manually stop rest",
                  valueValidator: (val) {
                    final parsed = int.tryParse(val) ?? (-1);
                    return parsed < 0
                        ? "Non negative number is required"
                        : null;
                  },
                ),TextFormField(
                  initialValue: workout.notes,
                  key: _noteKey,
                  maxLines: 10,
                  style: textTheme.subhead,
                  decoration: InputDecoration(
                    hintText: 'Additional Notes...',
                  ),
                )
              ],
            ),
            confirmCallack: () {
              confirmCallback(workout.rebuild((b) => b
                ..title = _titleKey.currentState.value
                ..notes = _noteKey.currentState.value

                ..uniformWorkoutDefinition.warmupDurationSecs =
                  int.parse(_warmupDurattionKey.currentState.value)
                ..uniformWorkoutDefinition.calldownDurationSecs =
                  int.parse(_cooldownDurattionKey.currentState.value)
                ..uniformWorkoutDefinition.numberOfActivity =
                  int.parse(_numberOfActivityKey.currentState.value)
                ..uniformWorkoutDefinition.interActivityRestDurationSec=
                  int.parse(_interActivityRestDurationKey.currentState.value)

                ..uniformWorkoutDefinition.activityDefinition.numberOfSeries =
                    int.parse(_numberOfSeries.currentState.value)
                ..uniformWorkoutDefinition.activityDefinition.manualStopSerie =
                    _serieDuration.currentState.check
                ..uniformWorkoutDefinition.activityDefinition.serieDurationSecs =
                    int.tryParse(_serieDuration.currentState.value) ?? null
                ..uniformWorkoutDefinition.activityDefinition.manualStopRest =
                    _restDuration.currentState.check
                ..uniformWorkoutDefinition.activityDefinition.restDurationSecs =
                    int.tryParse(_restDuration.currentState.value) ?? null

                ));
              Navigator.pop(context);
            },
          );
        },
        connect: (state) => null);
  }
}
