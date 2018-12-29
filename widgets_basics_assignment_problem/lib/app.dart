import 'package:flutter/material.dart';
import './text_control.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Basics Assignment Problem',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Widgets Basics Assignment Problem'),
          ),
          body: TextControl()),
    );
  }
}
