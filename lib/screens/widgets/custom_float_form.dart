import 'package:flutter/material.dart';

class CustomFloatForm extends StatelessWidget {
  final IconData icon;
  final VoidCallback qrCallback;
  final isMini;
  final List<Color> floatingButtonBackground = [Colors.deepOrange.shade500, Colors.deepOrange.shade200];

  CustomFloatForm({this.icon, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: floatingButtonBackground)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
