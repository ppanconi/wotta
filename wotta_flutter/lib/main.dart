import 'package:flutter/material.dart';
import 'package:built_redux/built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_flutter/connectors/workouts_connector.dart';
import 'package:wotta_flutter/presentation/workout.dart';
import 'package:wotta_flutter/routes.dart';



void main() => runApp(WottaApp());

class WottaApp extends StatefulWidget {
  final Store<WottaAppState, WottaAppStateBuilder, WottaActions> store =
      Store(wottaReducerBuilder.build(), WottaAppState(), WottaActions());

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
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
//        home: WorkoutView(),

//        theme: ArchSampleTheme.theme,
//        localizationsDelegates: [
//          ArchSampleLocalizationsDelegate(),
//          BuiltReduxLocalizationsDelegate(),
//        ],
        routes: WottaRoutes.routes,
      ),
    );
  }
}

