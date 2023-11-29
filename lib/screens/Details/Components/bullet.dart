import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Color(0xffd7d7da),
        borderRadius: BorderRadius.circular(50),),
      width: 6,
      height: 6,
    );
  }
}
