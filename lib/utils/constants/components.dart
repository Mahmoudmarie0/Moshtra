import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'assets.dart';
import 'colors.dart';


//SnackBar
SnackbarController GetSnackbarError({required String message,required HexColor Color}) =>Get.snackbar(

    '',
    '',
  snackPosition: SnackPosition.BOTTOM,
  colorText: AppColors.white,
  borderRadius: 100,
  backgroundColor:Color,
  padding: EdgeInsets.symmetric(vertical: 15.h),
  titleText: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width:16.w ,),
      SvgPicture.asset(AssetsPaths.SallaSmallIcon, width: 20.w, height: 20.h,),
      SizedBox(width: 9.w,),
      Text(message,style: TextStyle(fontSize:14.sp,fontWeight: FontWeight.w400,color: AppColors.white,)),
    ],
  ) ,
  messageText: Container(
    padding:EdgeInsets.only(left: 16) ,
  ),
  duration: Duration(seconds: 2),


);

//ButtonStyle
final ButtonStyle button = ElevatedButton.styleFrom(
    minimumSize: Size(350, 60),
    backgroundColor: Color(0xfff88160),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    )
);
