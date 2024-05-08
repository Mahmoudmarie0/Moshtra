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
        prefixIcon:Get.locale?.languageCode == "en"? Icon(Icons.search,color: Colors.black, ): null,
        suffixIcon:Get.locale?.languageCode == "ar"? Icon(Icons.search,color: Colors.black, ):null ,
        label:
        CustomText(text: 'search_hint'.tr,fontSize: 18,fontweight: FontWeight.w300,color: AppColors.placeholder,alignment: Get.locale?.languageCode == "en"? Alignment.centerLeft:Alignment.centerRight,),
      ),
    ),
  );

}