import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  // Products is immutable, which is required for StatelessWidgets
  final List<String> products;

  // optional parameter
  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards = Center(
      child: Text('No products found, please add some.'),
    );

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
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
