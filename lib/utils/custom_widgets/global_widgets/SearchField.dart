import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../screens/Search/view.dart';
import '../../constants/colors.dart';
import '../../custom_text/view.dart';

Widget SearchTextFormField() {
  return  Container(

padding: EdgeInsets.only(right: 30),
    width: 343.w,
    height: 48.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:AppColors.white,
    ),
    child: TextFormField(
      onTap: ()=>Get.to(SearchScreen()),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search,color: Colors.black,),
        label:CustomText(text: 'What are you looking for? ',fontSize: 18,fontweight: FontWeight.w300,color: AppColors.placeholder,alignment: Alignment.centerLeft,),
      ),
    ),
  );

}