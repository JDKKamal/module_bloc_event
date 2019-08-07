import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_bloc.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_state.dart';
import 'package:module_bloc_event/models/drawer.dart';

class CommonDrawer extends StatefulWidget {
  @override
  CommonDrawerState createState() {
    return new CommonDrawerState();
  }
}

class CommonDrawerState extends State<CommonDrawer> {
  DrawerBloc drawerBloc;

  @override
  void initState() {
    super.initState();

    drawerBloc = BlocProvider.of<DrawerBloc>(context);
    drawerBloc.getDrawerMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocBuilder(
            bloc: drawerBloc,
            builder: (context, DrawerState state) {
              return  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    this._buildUserAccountProfileHeader(),
                    _buildDrawerBody(state.drawers)
                  ]);
            }));
  }

  _buildUserAccountProfileHeader() => Expanded(
    flex: 0,
    child:  Container(
        color: Colors.deepOrange,
        padding:
        EdgeInsets.only(top: 35.0, left: 20.0, bottom: 20.0),
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: new CircleAvatar(
              radius: 40,
              child: ClipOval(
                  child: new Icon(Icons.supervised_user_circle, size: 80)),
            ),
          ),

          Container(
            margin: EdgeInsets.all(5),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
               'Flutter',
                style: new TextStyle(
                    fontSize: 20.0, color: Colors.white),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Text('info@fluttertutorial.in',
                style: new TextStyle(
                    fontSize: 14.0, color: Colors.white)),
          )
        ])),
  );

  _buildDrawerBody(List<DrawerMenuResponse> drawerMenuList) => Expanded(
      flex: 2,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 1.0),
          physics: BouncingScrollPhysics(),
          itemCount: drawerMenuList.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(child: InkWell(
              onTap: () {
                switch (index) {
                  case 0:
                    break;

                  case 1:

                    break;

                  case 2:

                    break;

                  case 3:

                    break;

                  case 4:
                    break;

                  case 5:

                    break;
                }
                Navigator.of(context).pop();
              },
              child: ListTile(
                  leading: drawerMenuList[index].icon,
                  title: drawerMenuList[index].title),
            ));
          }));
}

