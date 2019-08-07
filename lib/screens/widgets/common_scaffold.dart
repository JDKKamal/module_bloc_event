import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_bloc.dart';

import 'common_drawer.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showDrawer;
  final backGroundColor;
  final actionFirstIcon;
  final scaffoldKey;
  final elevation;

  CommonScaffold({this.appTitle,
    this.bodyData,
    this.showDrawer = false,
    this.backGroundColor,
    this.actionFirstIcon = Icons.search,
    this.scaffoldKey,
    this.elevation = 1.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey != null ? scaffoldKey : null,
      appBar: AppBar(
        //leading: new Icon(Icons.menu),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: elevation,
        backgroundColor: Colors.deepOrange,
        title: Text(appTitle,
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),

        /* actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, UIData.searchRoute);
            },
            icon: Icon(actionFirstIcon),
          )
        ],*/
      ),
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      drawer: showDrawer ? CommonDrawer(): null,
      body: bodyData,
    );
  }
}
