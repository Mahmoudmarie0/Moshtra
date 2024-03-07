import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment/utils/styles.dart';

class Total_price extends StatelessWidget {
  const Total_price({super.key,  required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          "Total",
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        Spacer(),
        Text(
          price,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),





      ],



    );
  }
}