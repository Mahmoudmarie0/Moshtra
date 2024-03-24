import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/utils/constants/colors.dart';

import '../styles.dart';
import 'global_widgets/SearchField.dart';

AppBar buildAppBar( { final String? title, final bool arrowBackDisblay=true,final bool SearchDisplay=true}) {
  return AppBar(
    backgroundColor: AppColors.white,
    leading: arrowBackDisblay?
    InkWell(
      onTap: ()=>Get.back(),
         child: Icon(Icons.arrow_back_ios_new_outlined))
        :SizedBox(width: 0,),


    title:  SearchDisplay? SearchTextFormField():Text(
      title??'',
      textAlign: TextAlign.center,
      style: Styles.style25,

    ),




  );
}












