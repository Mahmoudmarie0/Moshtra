
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("CategoriesScreen",style:TextStyle(fontWeight:FontWeight.w600,fontSize: 40) ,)),
              Center(child: Text("Soon....",style:TextStyle(fontWeight:FontWeight.w400,fontSize: 30) ,)),]));
  }
}