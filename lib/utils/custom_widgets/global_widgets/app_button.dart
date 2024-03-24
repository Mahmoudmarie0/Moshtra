import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

class buttonWidget extends StatelessWidget {
  final String text;
  final dynamic width;
  final dynamic height;
  final int radius;
  final void Function()? onPress;
  final FontWeight fontWeight;
  final int fontSize;
  final Color color;
  final Color conColor;


  const buttonWidget({
    Key? key, required this.text, required this.width,  required this.height, required this.radius, required this.onPress, required this.fontWeight, required this.fontSize, required this.color, required this.conColor,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color:conColor,
        //AppColors.orange,
      ),
      child: MaterialButton(
          onPressed: onPress,
          child: Text(
            //"Login",
            text,
            style: TextStyle(
              color: color,
              //AppColors.white,
              fontWeight:fontWeight,
              fontSize: fontSize.sp,
            ),
          )
      ),
    );
  }
}