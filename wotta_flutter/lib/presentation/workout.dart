import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/connectors/workouts_connector.dart';
import 'package:wotta_flutter/keys.dart';
import 'package:wotta_flutter/routes.dart';

class WorkoutsView extends StatelessWidget {
  WorkoutsView() : super(key: WottaKeys.workoutWiev);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seved workouts:'),
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
  final _biggerFont = const TextStyle(fontSize: 18.0);

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
//        trailing: Icon(Icons.favorite_border,
//            color: Colors.red
//        ),
    );
  }
}

typedef OnConfirmWorkout = Function(Workout workout);

class WorkoutDetailView extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final GlobalKey<FormFieldState<String>> _titleKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _noteKey =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _numberOfSeries =
  GlobalKey<FormFieldState<String>>();

  final Workout workout;
  final OnConfirmWorkout confirmCallback;

  WorkoutDetailView(
      {@required Key key,
      @required this.workout,
      @required this.confirmCallback})
      : super(key: key);

  bool _isEditing() => workout.isSeved();

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    print("Building WorkoutDetailView ...");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing() ? "Editing Workout" : "Create new Workout",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: () {
              print("Eccoci: " + (new DateTime.now().millisecondsSinceEpoch).toString());

            },
          autovalidate: true,
          child: ListView(
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
              TextFormField(
                initialValue: workout.uniformWorkoutDefinition.activityDefinition.numberOfSeries.toString(),
                key: _numberOfSeries,
                decoration: InputDecoration(
                  labelText: "Number of Series:"
                ),
                validator: (val) {
                  final parsed = int.tryParse(val) ?? (-1);
                  return parsed < 0 ? "Non negative number is required" : null;
                },
              ),
              TextFormField(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: _isEditing() ? 'Save changes' : 'Add Workout',
        child: Icon(_isEditing() ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            confirmCallback(workout.rebuild((b) => b
              ..title = _titleKey.currentState.value
              ..notes = _noteKey.currentState.value
              ..uniformWorkoutDefinition.activityDefinition.numberOfSeries = int.parse(_numberOfSeries.currentState.value)));

            Navigator.pop(context);
          } else {
//            _formKey.currentState.reset();
          }
        },
      )
    );
  }
}

class FormStateButton extends StatefulWidget{

  FloatingActionButton button;

  FormStateButton(this.button);

  @override
  State<StatefulWidget> createState() {
    return _FormStateButtonState();
  }

  refesrh() {

  }
}

class _FormStateButtonState extends State<FormStateButton> {

  @override
  Widget build(BuildContext context) {
    return widget.button;
  }



}