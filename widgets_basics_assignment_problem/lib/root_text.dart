import 'package:flutter/material.dart';

class RootText extends StatefulWidget {
  @override
  State<RootText> createState() {
    return RootTextState();
  }
}

class RootTextState extends State<RootText> {
  String currentText = 'Widgets Basics Assignment Problem - Initial Text';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(currentText),
        RaisedButton(
          child: Text('Change the text'),
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
