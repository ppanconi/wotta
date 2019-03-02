

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wotta_core/wotta_core.dart';

class ExecutionView extends StatelessWidget {

  final Executor executor;
  final Function(Executor) togglePauseCurrentItem;
  final Function(Executor) completeCurrentItem;

  ExecutionView(this.executor, this.togglePauseCurrentItem, this.completeCurrentItem);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('"${executor.execution.title}" workout'),
        ),
        body: executor.currentExecutionItem == null ? Text('...') : Container(
//          decoration: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(executor.currentExecutionItem.title,
                          textScaleFactor: 2.0)
                    )
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(
                          executor.currentExecutionItem.subTitle,
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.black45),
                        )
                    )
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(
                          executor.currentExecutionItem.notes,
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic),
                        )
                    )
                  ]),

              Expanded(
                child:Center(
                  child: provideItemController(context)
                )
              )
            ]
          )),
      );
  }

  Widget provideItemController(BuildContext context) {

    var size = 100.0;
//    if (executor.currentExecutionItem.manualStop) {
    if (true) {
      var buttons = [
        IconButton(icon: new Icon(Icons.check, color: Colors.green),
          iconSize: size,
          onPressed: () => completeCurrentItem(executor),
        )
      ];
      if (executor.isPaused) {
        buttons.add(
            IconButton(
              icon: new Icon(Icons.play_arrow, color: Theme.of(context).accentColor),
              iconSize: size,
              onPressed: () => togglePauseCurrentItem(executor),
            )
        );
      } else {
        buttons.add(
            IconButton(
              icon: new Icon(Icons.pause, color: Theme.of(context).primaryColor,),
              iconSize: size ,
              onPressed: () => togglePauseCurrentItem(executor),
            )
        );
      }

      return Row(mainAxisAlignment: MainAxisAlignment.center,
          children: buttons);


    } else {
      return Text('Timer');
    }

  }
}

class _CButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Colors.purple,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(Icons.android),
        color: Colors.white,
        onPressed: () { print("filled background"); },
      ),
    );
  }

}