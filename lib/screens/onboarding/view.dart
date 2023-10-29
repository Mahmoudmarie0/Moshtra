import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(
        child: Text(
          "Splash Screen",style: TextStyle( fontWeight: FontWeight.w700,fontSize:40),
        ),
      ),


    );
  }
}
