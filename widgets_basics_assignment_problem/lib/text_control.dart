import 'package:flutter/material.dart';
import './output_text.dart';

class TextControl extends StatefulWidget {
  @override
  State<TextControl> createState() {
    return TextControlState();
  }
}

class TextControlState extends State<TextControl> {
  String currentText =
      'Widgets Basics Assignment Problem - Initial Text Multiple files';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutputText(currentText),
        RaisedButton(
          child: Text('Change Text'),
          onPressed: () {
            setState(() {
              currentText = 'Changed Text';
            });
          },
        )
      ],
    );
  }
}
