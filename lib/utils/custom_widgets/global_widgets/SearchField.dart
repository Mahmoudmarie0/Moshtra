import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../custom_text/view.dart';

Widget SearchTextFormField() {
  return  Container(
padding: EdgeInsets.only(right: 30),
    width: 343.w,
    height: 48.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search,color: Colors.black,),
        label:CustomText(text: 'Search ',fontSize: 18,fontweight: FontWeight.w300,color: AppColors.grey,alignment: Alignment.centerLeft,),


      ),
    ),
  );

}