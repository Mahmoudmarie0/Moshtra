
import 'package:flutter/material.dart';
class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            child: Text(
              "Delivery",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}