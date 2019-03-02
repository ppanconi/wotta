
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
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
                        Navigator.pop(context);
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