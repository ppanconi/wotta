

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:built_redux/built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:path_provider/path_provider.dart';

class StateStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/wotta.002.json');
  }

  Future<WottaAppState> readState() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      print('loaded state $contents');

      return standardSerializers.deserializeWith(WottaAppState.serializer, json.decode(contents));

    } catch (e) {
      print(e);
      return WottaAppState();
    }
  }

  Future<File> writeState(WottaAppState state) async {
    final file = await _localFile;

    // Write the file
    var jsonState = json.encode(standardSerializers.serializeWith(WottaAppState.serializer, state));

    return file.writeAsString(jsonState);
  }

  const StateStorage();
}

const fileStorage = StateStorage();

NextActionHandler loggingMiddleware(MiddlewareApi api) =>
        (ActionHandler next) => (Action action) {
      final prevState = api.state;
      print('Action: $action');
      print('Previous State: ${prevState}');
      next(action);
      if (prevState != api.state) {
        print('Action: $action');
        print('Resulting State: ${api.state}');
      }
    };

NextActionHandler savingOnFileMiddleware(MiddlewareApi api) =>
        (ActionHandler next) => (Action action) {
      final prevState = api.state;
      next(action);
      if (prevState != api.state) {
        fileStorage.writeState(api.state);
        print('state saved to file');
      }
    };


final middlewareBuilder = new MiddlewareBuilder<WottaAppState, WottaAppStateBuilder, WottaActions>()
  ..add(WottaActionsNames.completeCurrentExecutionItem, callback);

void callback(MiddlewareApi<WottaAppState, WottaAppStateBuilder, WottaActions> api, ActionHandler next, Action<CallbackPayload> action) {

  next(action);
  action.payload.callback(api.state);

}
