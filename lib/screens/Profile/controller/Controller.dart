import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/utils/constants/assets.dart';

import '../../../utils/constants/colors.dart';
import '../../login/view.dart';

class ProfileCopntroller extends GetxController{
  bool isToggled=false;
  OnSwitch(bool value){
    isToggled=true;
    isToggled=value;
    update();
  }

  void navigateBack(){

    Get.back();

  }

  Future logOutPopUp(context) async => await showDialog(context: context, builder: (context)=>Directionality(
    textDirection:TextDirection.ltr,
    child: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r))),
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 279.w,
          height:300.h ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r),
              color: AppColors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Column(
              children: [

                SizedBox(height: 20.h,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Lottie.asset(AssetsPaths.Logout),
                        SizedBox(height: 11.h,),
                        Text(
                          "Are you sure you \n want to log out? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            fontSize: 18.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:5.h,horizontal:26.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 122.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26.r),
                                color: AppColors.orange,
                              ),
                              child: MaterialButton(
                                  onPressed: (){
                                    Get.offAll(()=>LoginScreen(),transition: Transition.downToUp);

                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: 7.h,),
                          Expanded(
                            child: Container(
                              width: 122.w,
                              height: 36.h,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(26.r),
                                color: AppColors.white,
                              ),
                              child: MaterialButton(
                                  onPressed: (){navigateBack();},
                                  child: Text(
                                    'No'.tr,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 33.h,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),);






}