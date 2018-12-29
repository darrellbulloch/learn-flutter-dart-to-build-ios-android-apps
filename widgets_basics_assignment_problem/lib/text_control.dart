import 'package:flutter/material.dart';
import './output_text.dart';

class TextControl extends StatefulWidget {
  @override
  State<TextControl> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _currentText =
      'Widgets Basics Assignment Problem - Initial Text Multiple files';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutputText(_currentText),
        RaisedButton(
          child: Text('Change Text'),
          onPressed: () {
            setState(() {
              _currentText = 'Changed Text';
            });
          },
        )
      ],
    );
  }
}
