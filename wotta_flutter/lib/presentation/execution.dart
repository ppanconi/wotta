

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wotta_core/wotta_core.dart';

class ExecutionView extends StatelessWidget {

  final Executor executor;

  ExecutionView(this.executor);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('"${executor.execution.title}" workout'),
        ),
        body: Container(
//          decoration: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(executor.currentExecutionItem.title)
                  ]),
              Expanded(
                child:Center(
                  child: Text('Exection...'),
                )
              )
            ]
          )),
      );
  }

}