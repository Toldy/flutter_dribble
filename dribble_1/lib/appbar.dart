import 'package:flutter/material.dart';

Widget heroAppBar({BuildContext context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Hero(
      tag: 'app_bar',
      child: Builder(builder: (BuildContext context) {
        return MediaQuery.removePadding(
          context: context,
          child: AppBar(
            centerTitle: true,
            title: Image.asset(
              'assets/images/nike_logo.png',
              height: 60,
            ),
            elevation: 0,
          ),
          removeBottom: true,
        );
      }),
    ),
  );
}