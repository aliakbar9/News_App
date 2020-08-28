import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Mak',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        Text(
          'news',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
