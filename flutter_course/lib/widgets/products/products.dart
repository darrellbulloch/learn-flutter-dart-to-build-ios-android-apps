import 'package:flutter/material.dart';
import './product_card.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  // Products is immutable, which is required for StatelessWidgets
  final List<Product> _products;

  Products(this._products) {
    print('[Products Widget] Constructor');
  }

  // Widget _buildProductItem(BuildContext context, int index) {
  //   return ProductCard(_products[index], index);
  // }

  Widget _buildProductList() {
    Widget productCards = Center(
      child: Text('No products found, please add some.'),
    );

    if (_products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(_products[index], index),
        itemCount: _products.length,
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');

    return _buildProductList();
  }
}
