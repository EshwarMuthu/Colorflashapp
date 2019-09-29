import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "ColorsFlash",
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
              ),
            ),
            body: JumbleColor()));
  }
}

class JumbleColor extends StatefulWidget {
  JumbleColorState createState() => new JumbleColorState();
}

class JumbleColorState extends State<JumbleColor> {
  Color _color;
  Color randomizecolor() {
    setState(() {
      RandomColor _randomColor = RandomColor();
      _color = _randomColor.randomColor();
      const oneSecond = const Duration(seconds: 1);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });
    return _color;
  }

  // Widget gridwidget() {
  //   return Container(
  //     color: randomizecolor(),
  //   );
  // }
  List<Widget> gridChildrenWidget() {
    List<Widget> gridchildren = <Widget>[];
    for (int i = 0; i < 9; i++) {
      gridchildren.add(Container(
        color: randomizecolor(),
      ));
    }
    return gridchildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: gridChildrenWidget()),
    );
  }
}
