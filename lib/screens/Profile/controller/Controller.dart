
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/main.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/custom_widgets/global_widgets/app_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import '../../auth/login/view.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileCopntroller extends GetxController{

  bool isToggled=false;





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseAuth.instance.currentUser!.email.toString();
    launchURL;
    update();

  }

  OnSwitch(bool value){
    isToggled=true;
    isToggled=value;
    update();
  }

  void navigateBack(){
    Get.back();
  }


  void deleteAccount(){
    FirebaseAuth.instance.currentUser!.delete();
    Get.to(LoginScreen());
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
                            child: buttonWidget(text: 'Yes', width: 119.w, height: 33.h, radius: 26, onPress: () {
                              sharedPref!.setBool('HomeLayout', false);
                              sharedPref!.setBool('onboarding', true);
                              Get.offAll(()=>LoginScreen(),transition: Transition.downToUp);

                            }, fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.white, conColor: AppColors.orange,)

                          ),
                          SizedBox(width: 7.h,),
                          Expanded(
                            child:
                              buttonWidget(text: 'No', width: 113.w, height: 33.h, radius: 26, onPress: () { navigateBack();}, fontWeight: FontWeight.w500, fontSize: 12, color:  AppColors.black,conColor: AppColors.white,)
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
  Future deleteAccountPopUp(context) async => await showDialog(context: context, builder: (context)=>Directionality(
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
                        Center(child: Lottie.asset(AssetsPaths.deleteAccount)),
                        SizedBox(height: 11.h,),
                        Text(
                          "Are you sure you \n want to delete your account? ",
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
                              child: buttonWidget(text: 'Yes', width: 119.w, height: 33.h, radius: 26, onPress: () {
                                sharedPref!.setBool('HomeLayout', false);
                                sharedPref!.setBool('onboarding', true);
                                FirebaseAuth.instance.currentUser!.delete();
                                GetSnackbarError( message: 'Your account has been successfully deleted',Color: AppColors.green);
                                Get.offAll(()=>LoginScreen(),transition: Transition.downToUp);

                              }, fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.white, conColor: AppColors.orange,)

                          ),
                          SizedBox(width: 7.h,),
                          Expanded(
                              child:
                              buttonWidget(text: 'No', width: 113.w, height: 33.h, radius: 26, onPress: () { navigateBack();}, fontWeight: FontWeight.w500, fontSize: 12, color:  AppColors.black,conColor: AppColors.white,)
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


  launchURL() async {
    const url = 'https://docs.google.com/document/d/1N7Ploa5PLqshNt9n68DVjDn17IJy1GC7IU-R9O_K354/edit?usp=sharing';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      update();
    } else {
      throw 'Could not launch $url';
    }
  }





}