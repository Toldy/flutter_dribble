import 'package:dribbble_1/appbar.dart';
import 'package:dribbble_1/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoeDetailPage extends StatelessWidget {
  final Shoe shoe;

  const ShoeDetailPage({Key key, @required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: heroAppBar(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: shoe.backgroundColor,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned.fill(
                  child: Hero(
                    tag: 'shoe_image_background_${shoe.name}',
                    child: Container(color: shoe.backgroundColor),
                  ),
                ),
                Hero(
                  tag: 'shoe_image_background_text_${shoe.name}',
                  child: Text(
                    shoe.backgroundText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0x07000000),
                        fontSize: MediaQuery.of(context).size.width / 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Hero(tag: 'shoe_image_${shoe.name}', child: shoe.image),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  shoe.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      shoe.oldPrice,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xFFDD7F7A),
                          fontSize: 18),
                    ),
                    Text(
                      shoe.price,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'AVAILABLE SIZES',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
