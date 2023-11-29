
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:moshtra/utils/constants/colors.dart';


import '../../utils/constants/assets.dart';
import '../Categories/model.dart';
import 'controller/Controller.dart';
//ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  HomeController homeController=Get.put(HomeController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:  EdgeInsets.only(top: 44,left: 16,right: 16),
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AssetsPaths.MoshtraLogoBlack),
                  Spacer(),
                Icon(
                  Icons.search_rounded,
                ),
                ],
              ),
              SizedBox(height: 20.h,),
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (Controller)=>
                     ConditionalBuilder(
                        condition: Controller.homeModel!=null &&  Controller.categoriesModel!=null,
                        builder:(context)=>Controller.products(Controller.homeModel!,Controller.categoriesModel!,Get.context!),
                        fallback: (context)=>Center(child: CircularProgressIndicator())
                    ),

              ),
            ]
            ),
          ),
        ));
  }
}













