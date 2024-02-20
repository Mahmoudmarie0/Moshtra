import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

class buttonWidget extends StatelessWidget {
  final String text;
  final int width;
  final int height;
  final int radius;
  final void Function()? onPress;
  final FontWeight fontWeight;
  final int fontSize;


  const buttonWidget({
    Key? key, required this.text, required this.width, required this.height, required this.radius, required this.onPress, required this.fontWeight, required this.fontSize,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: AppColors.orange,
      ),
      child: MaterialButton(
          onPressed: onPress,
          child: Text(
            //"Login",
            text,
            style: TextStyle(
              color:  AppColors.white,
              fontWeight:fontWeight,
              fontSize: fontSize.sp,
            ),
          )
      ),
    );
  }
}