import 'package:flutter/widgets.dart';

class Shoe {
  final String name;
  final String price;
  final String oldPrice;
  final String backgroundText;
  final Color backgroundColor;
  final Image image;

  Shoe(this.name, this.backgroundText, this.price, this.oldPrice,
      this.backgroundColor, this.image);
}
