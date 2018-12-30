import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function _addProduct;

  ProductController(this._addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {
          _addProduct('Sweets');
        },
        child: Text('Add Product'));
  }
}
