import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wotta_core/wotta_core.dart';


class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
    this.enabled
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;
  final bool enabled;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    if (enabled) {
      double progress = (1.0 - animation.value) * 2 * math.pi;
      canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
    }

  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor ||
        enabled != old.enabled;
  }
}

class ExecutionView extends StatefulWidget {
  final Executor executor;
  final Function(Executor) togglePauseCurrentItem;
  final Function(Executor) completeCurrentItem;

  ExecutionView(this.executor, this.togglePauseCurrentItem,
      this.completeCurrentItem);

  @override
  State<StatefulWidget> createState() => ExecutionViewState();

}

class ExecutionViewState extends State<ExecutionView>
    with TickerProviderStateMixin {
  AnimationController controller;
  int itemIndex;

  Executor get executor => widget.executor;

  @override
  void initState() {
    super.initState();
    controller = makeAnimationController();
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  AnimationController makeAnimationController() {
    itemIndex = executor.currentExecutionItemIndex;
    var animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: executor.currentExecutionItem.manualStop ? 0
          : executor.currentExecutionItem.durationSecs),
      value: 1.0,

    );
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.dismissed) {
        this.widget.completeCurrentItem(executor);
      }
    });
    return animationController;
  }

  @override
  Widget build(BuildContext context) {

    if (executor.currentExecutionItem != null) {
      if (itemIndex != executor.currentExecutionItemIndex) {
        this.controller = makeAnimationController();
      }

      if (controller.isAnimating && executor.isPaused)
        controller.stop();
      else if (!controller.isAnimating && !executor.isPaused &&
          !executor.currentExecutionItem.manualStop) {
        controller.reverse(
            from: controller.value);
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('"${executor.execution.title}" workout'),
      ),
      body: executor.currentExecutionItem == null
          ? Text('...')
          : Container(
//          decoration: ,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(executor.currentExecutionItem.title,
                            textScaleFactor: 2.0))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(
                          executor.currentExecutionItem.subTitle + ' (manual: ${executor.currentExecutionItem.manualStop})',
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.black45),
                        ))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                        child: Text(
                          executor.currentExecutionItem.notes,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                        ))
                  ]),
                  Expanded(
//                child:Center(
                      child: provideItemController(context)
//                )
                      )
                ])),
    );
  }

  Widget provideItemController(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    var size = 100.0;
    var buttons = [
      IconButton(
        icon: new Icon(Icons.check, color: Colors.green),
        iconSize: size,
        onPressed: () => this.widget.completeCurrentItem(executor),
      )
    ];
    if (executor.isPaused) {
      buttons.add(IconButton(
        icon: new Icon(Icons.play_arrow, color: Theme.of(context).accentColor),
        iconSize: size,
        onPressed: () => this.widget.togglePauseCurrentItem(executor),
      ));
    } else {
      buttons.add(IconButton(
        icon: new Icon(
          Icons.pause,
          color: Theme.of(context).primaryColor,
        ),
        iconSize: size,
        onPressed: () => this.widget.togglePauseCurrentItem(executor),
      ));
    }

    var buttonsRow =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: buttons);

    var widget = Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Align(
            alignment: FractionalOffset.center,
            child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return new CustomPaint(
                                painter: TimerPainter(
                                    animation: controller,
                                    backgroundColor: themeData.disabledColor,
                                    color: themeData.indicatorColor,
                                    enabled: ! this.widget.executor.currentExecutionItem.manualStop
                                ));
                          },
                        )
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return new Container(
                                    padding: EdgeInsets.only(top: 35.0),
                                    child: Text(
                                    timerString,
                                    style: themeData.textTheme.display3,
                                  ));
                                }),
                          ],
                        ),
                      ),
                      Center(child: buttonsRow)
                ]))));

    return widget;
  }

  String get timerString {

    if (executor.currentExecutionItem.manualStop) {
      return '- - : - -';
    } else {
      Duration duration = controller.duration * controller.value;
      return '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

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
        onPressed: () {
          print("filled background");
        },
      ),
    );
  }
}
