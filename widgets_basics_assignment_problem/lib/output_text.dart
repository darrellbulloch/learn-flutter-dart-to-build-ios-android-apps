import 'package:flutter/material.dart';

class OutputText extends StatelessWidget {
  final String currentText;

  OutputText(this.currentText);

  @override
  Widget build(BuildContext context) {
    return Text(currentText);
  }
}
