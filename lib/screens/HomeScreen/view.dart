import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Text("HomeScreen",style:TextStyle(fontWeight:FontWeight.w700,fontSize: 12) ,),
        Text("Soon....",style:TextStyle(fontWeight:FontWeight.w700,fontSize: 7) ,),



      ],





    ),
    );
  }
}
