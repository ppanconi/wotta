
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:screen/screen.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/presentation/execution.dart';

class StartWorkoutConnector extends StoreConnector<WottaAppState, WottaActions, Executor> {

  @override
  Widget build(BuildContext context, Executor executor, WottaActions actions) {
    return ExecutionView(executor,
            (executor) => actions.togglePauseCurrentExecutionItem(executor),
            (executor) {
                actions.completeCurrentExecutionItem(
                    CallbackPayload(executor, (state) {
                      if (state.executor.currentExecutionItem == null) {

                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Workout ${state.executor.execution.title} completed!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Do you want to save execution?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Dont' save"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),

                                FlatButton(
                                  child: Text('Yes Save it!',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                    )
                                  ),
                                  onPressed: () {
                                    actions.saveWorkoutExecution(state.executor.execution as WorkoutExecution);
                                    Screen.keepOn(false);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ).then((onValue) => Navigator.pop(context));

                      }
                    })
                );
            }
    );

  }

  @override
  Executor connect(WottaAppState state) {
    assert(state.executor != null);
    return state.executor;
  }

}