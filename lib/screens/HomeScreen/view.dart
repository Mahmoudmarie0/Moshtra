import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("HomeScreen",style:TextStyle(fontWeight:FontWeight.w600,fontSize: 40) ,)),
        Center(child: Text("Soon....",style:TextStyle(fontWeight:FontWeight.w400,fontSize: 30) ,)),



      ],





    ),
    );
  }
}
