import 'package:flutter/material.dart';
import 'package:moshtra/screens/Details/Components/bullet.dart';

class BulletTabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Bullet(),
        Bullet(),
        Bullet(),
        Bullet(),
        Bullet(),
        Bullet(),

      ],
    );
  }


}
