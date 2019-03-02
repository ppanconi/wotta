import 'package:flutter/material.dart';
import 'package:built_redux/built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_flutter/routes.dart';
import 'middlewares.dart';


void main() async {
  var state = await fileStorage.readState();
  runApp( WottaApp(state));
}


class WottaApp extends StatefulWidget {

  final Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }

  WottaApp(WottaAppState state):
    store = Store(
        wottaReducerBuilder.build(), state, WottaActions(),
        middleware: [middlewareBuilder.build(), savingOnFileMiddleware]);
}

class AppState extends State<WottaApp> {
  Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: MaterialApp(
        title: 'Wotta',
        routes: WottaRoutes.routes,
      ),
    );
  }
}
