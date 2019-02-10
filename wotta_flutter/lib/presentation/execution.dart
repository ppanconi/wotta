

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExecutionView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Workout Esecution'),
        ),
        body: Container(
//          decoration: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Exection...'),
              )
            ]
          ),
        )
      );
  }

}