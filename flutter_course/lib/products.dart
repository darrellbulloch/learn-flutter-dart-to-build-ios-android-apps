import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  // Products is immutable, which is required for StatelessWidgets
  final List<String> products;

  // optional parameter
  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return Column(
      children: products
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element),
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
