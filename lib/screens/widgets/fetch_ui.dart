import 'package:flutter/material.dart';

showProgress(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent)),
      ));
}

expandStyle(int flex, Widget child) =>
    Expanded(
        flex: flex,
        child: child);

hideProgress(BuildContext context) {
  Navigator.pop(context);
}
