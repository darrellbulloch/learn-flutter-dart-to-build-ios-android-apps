import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  // received from outside and cannot be change
  // note that the state is managed in the State class below
  final String startingProduct;

  ProductManager({this.startingProduct = 'Sweet Tester'}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State<ProductManager> createState() {
    print('[ProductManager Widget] createState()');
    return ProductManagerState();
  }
}

class ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    // Always called first
    super.initState();

    print('[ProductManagerState Widget] initState()');

    // widget is a property that gives this class access to properties
    // in the associated StatefulWidget class
    // Note that initState() runs before build(), so there is no
    // need to tell Flutter that the state is changing via setState()
    // Nothing has been rendered to the device yet, so no need to re-render.
    _products.add(widget.startingProduct);
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManagerState Widget] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  ProductManagerState() {
    print('[ProductManagerState Widget] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState Widget] build()');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // Notify the framework that the internal state of this object
              // has changed.
              // Whenever you change the internal state of a [State] object,
              // make the change in a function that you pass to [setState]:
              // The provided callback is immediately called synchronously.
              // It must not return a future (the callback cannot be async),
              // since then it would be unclear when the state was actually being set.
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Product'),
          ),
        ),
        Products(_products),
      ],
    );
  }
}
