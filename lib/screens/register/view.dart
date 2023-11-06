import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(child: Text("Register Page",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black,fontSize: 40.sp),)),
            Text("Soon...",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),


      ],




        ),



    );
  }
}
