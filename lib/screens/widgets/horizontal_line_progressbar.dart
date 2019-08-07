import 'package:flutter/material.dart';

class HorizontalLineProgressBar extends StatefulWidget {
  @override
  _HorizontalLineProgressBarState createState() =>
      new _HorizontalLineProgressBarState();
}

class _HorizontalLineProgressBarState extends State<HorizontalLineProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrange.shade400,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.deepOrange.shade300
        ),
        value: animation.value,
      ),
    ));
  }
}
