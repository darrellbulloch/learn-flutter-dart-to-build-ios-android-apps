import 'package:flutter/material.dart';

class Product {
  // We don't update a product in this app,
  // So, the fields can be final
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;

  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      this.isFavorite = false});
}
