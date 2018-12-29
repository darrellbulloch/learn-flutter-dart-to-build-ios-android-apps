import 'package:flutter/material.dart';
import './product_manager.dart';

void main() {
  Widget app = MyApp();

  runApp(app);
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager('Food Tester'),
      ),
    );
  }
}
