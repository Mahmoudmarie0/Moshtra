
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({required this.title, required this.value});
  final String title,value;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),







      ],



    );
  }
}