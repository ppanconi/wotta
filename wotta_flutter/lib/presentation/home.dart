import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:wotta_flutter/presentation/executions_list.dart';
import 'package:wotta_flutter/presentation/workout.dart';

class WottaHomePage extends StatelessWidget {

  final String title = 'Wotta';

  WottaHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text(title),
//        ),
//        drawer: Drawer(
//          child: ListView(
//            children: <Widget>[
//              DrawerHeader(
//                child: Text(
//                  "Hello Andy!!",
//                  textAlign: TextAlign.justify,
//                  textScaleFactor: 2.0,
//                ),
//                decoration: BoxDecoration(color: Colors.green),
//              ),
//              ListTile(
//                title: Text("First"),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//              ListTile(
//                title: Text("Second"),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              )
//            ],
//          ),
//        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[],
              title: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.edit)),
                  Tab(icon: Icon(Icons.timer)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              children: [
                WorkoutsView(),
                StoreConnection<WottaAppState, WottaActions, BuiltList<WorkoutExecution>>(
                  connect: (state) => state.executions,
                  builder: (ctx, executions, actions) => ExecutionList(executions: executions),
                ) ,
              ],
            ),
          ),
        ));
  }
}