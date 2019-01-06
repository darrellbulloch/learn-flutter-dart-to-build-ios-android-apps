import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import '../../widgets/products/address_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  final int _productIndex;

  ProductCard(this._product, this._productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(_product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(_product.price.toString()),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/${_productIndex.toString()}'),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.red,
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/${_productIndex.toString()}'),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
