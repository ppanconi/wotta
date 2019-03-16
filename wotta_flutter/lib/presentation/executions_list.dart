import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/keys.dart';
import 'package:intl/intl.dart';

class ExecutionList extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 20.0);
  final _smallFont = const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

  final BuiltList<WorkoutExecution> executions;
  final Function(WorkoutExecution) onRemove;
  final Function(WorkoutExecution) onUndoRemove;

  ExecutionList({@required this.executions, this.onRemove, this.onUndoRemove})
      : super(key: WottaKeys.executionList);

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
//            onTap: () => Navigator.of(context).push(
//              MaterialPageRoute(
//                builder: (_) {
//                  return EditWorkoutConnector(workouts[index]);
//                },
//              ),
//            ),
            child: Dismissible(
              key: GlobalKey(),
              onDismissed: (direction) {
                _removeExecution(context, executions[index]);
              },
              child: _buildRow(context, executions[index]),
            ));
      },
      itemCount: executions.length * 2,
    );
  }

  void _removeExecution(BuildContext context, WorkoutExecution execution) {
    onRemove(execution);

    Scaffold.of(context).showSnackBar(SnackBar(
        key: WottaKeys.snackbar,
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).backgroundColor,
        content: Text(
          'Deleted $execution.title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        action: SnackBarAction(
          label: 'Undo delation',
          onPressed: () => onUndoRemove(execution),
        )));
  }

  Widget _buildRow(BuildContext context, WorkoutExecution execution) {
    return ListTile(
      title: Text(
        execution.title,
        style: _biggerFont,
      ),
      subtitle: Text(execution.startedAt != null ?
        new DateFormat.yMMMMd().add_jm().format(execution.startedAt.toLocal()) : "",
          style: _smallFont, overflow: TextOverflow.ellipsis),
//      trailing: FlatButton(
//          onPressed: () {
//
//            Navigator.of(context).push(
//              MaterialPageRoute(
//                builder: (_) {
//                  return StoreConnection<WottaAppState, WottaActions, Null> (
//                      builder: (context, Null, actions) {
//                        actions.startWorkoutExecution(execution);
//                        return new StartWorkoutConnector();
//                      },
//                      connect: (state) => null
//                  );
//                },
//              ),
//            );
////            Navigator.push(context,  WottaRoutes.startWorkout);
//          },
//          child: Icon(Icons.play_circle_outline,
//              color: Colors.red
//          )
//      ),
    );
  }
}