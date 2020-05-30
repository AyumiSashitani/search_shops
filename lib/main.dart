import 'dart:js';

import 'package:flutter/material.dart';
import 'package:searchshops/MapPage.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      Center(
      child: RaisedButton(
        child: Text("お店をさがす"),
        onPressed: () {
          Navigator.of(context).push(_mapRoute());
        },
      ),
    );
  }
}

Route _mapRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MapPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween),
      child: child,
      );
    },
  );
}
