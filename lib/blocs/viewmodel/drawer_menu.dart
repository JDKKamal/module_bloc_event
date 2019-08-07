import 'package:flutter/material.dart';
import 'package:module_bloc_event/models/drawer.dart';

class DrawerMenuViewModel {
  List<DrawerMenuResponse> contactItems;
  DrawerMenuViewModel({this.contactItems});

  getDrawerMenu() => <DrawerMenuResponse>[
        DrawerMenuResponse(
            title: Text('Repair',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.home, color: Colors.orange.withOpacity(0.7))),
        DrawerMenuResponse(
            title: Text('Track',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.person_outline,
                color: Colors.black54.withOpacity(0.7))),
        DrawerMenuResponse(
            title: Text('About',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.supervised_user_circle,
                color: Colors.blueAccent.withOpacity(0.7))),
        DrawerMenuResponse(
            title: Text('Blog',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.new_releases,
                color: Colors.blueGrey.withOpacity(0.7))),
        DrawerMenuResponse(
            title: Text('Faqs',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.sentiment_satisfied,
                color: Colors.cyan.withOpacity(0.7))),
        DrawerMenuResponse(
            title: Text('Privacy Policy',
                style: TextStyle(
                    color: Colors.black54.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0)),
            icon: Icon(Icons.lock, color: Colors.red.withOpacity(0.7))),
      ];
}
