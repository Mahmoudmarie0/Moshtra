import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../global_controller/main_app_controller.dart';
import '../../main.dart';
import '../../utils/constants/assets.dart';
import '../login/view.dart';
import 'model.dart';

class OnboardingController extends GetxController
{
  final MainAppController mainAppController = Get.find();
  bool isLast = false;
  var boardController = PageController();
  List<BoardingModel> boardingList = [];



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(sharedPref!.getString('lang') == 'en') {
      boardingList.add(BoardingModel(
          image:  AssetsPaths.ShapeOnBoarding1,
          height: 300.h,
          width: 280.w,
          text: "Purchase Online !!",
          subtext: "Shop conveniently and securely online!",
          btntext:"Start"));
      boardingList.add(BoardingModel(
          image:AssetsPaths.ShapeOnBoarding2 ,
          height: 270.h,
          width: 337.w,
          text: "Track order !!",
          subtext: "Easily track your order and stay updated",
          btntext: 'Next'.tr));
      boardingList.add(BoardingModel(
          image:AssetsPaths.ShapeOnBoarding3,
          height: 298.h,
          width: 316.w,
          text: "Get your order !!",
          subtext: "Receive your orders with ease and speed!",
          btntext: "Enter"));
    }
    else{
      boardingList.add(BoardingModel(
          image:  AssetsPaths.ShapeOnBoarding1,
          height: 300.h,
          width: 280.w,
          text: "Purchase Online !!",
          subtext: "Shop conveniently and securely online!",
          btntext:"Start"));
      boardingList.add(BoardingModel(
          image:AssetsPaths.ShapeOnBoarding2 ,
          height: 270.h,
          width: 337.w,
          text: "Track order !!",
          subtext: "Easily track your order and stay updated",
          btntext: 'Next'.tr));
      boardingList.add(BoardingModel(
          image:AssetsPaths.ShapeOnBoarding3,
          height: 298.h,
          width: 316.w,
          text: "Get your order !!",
          subtext: "Receive your orders with ease and speed!",
          btntext: "Enter"));




    }

  }

  void onPageChange(index)
  {
    if(index == boardingList.length-1){
      isLast = true;
      update();
    }
    else{
      isLast = false;
      update();
    }
  }

  void onSubmit(){
    if(isLast){
      Get.offAll(() => LoginScreen());
    }
    else {
      boardController.nextPage(
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  // void onLangTapped(){
  //   if(sharedPref!.getString('lang') == 'ar'){
  //     mainAppController.changeAppLang('en');
  //   }
  //   else {
  //     mainAppController.changeAppLang('ar');
  //   }
  //   boardingList =[];
  //   boardingList.add(BoardingModel(image: sharedPref!.getString('lang') == 'en'? AssetsPaths.OnBoarding1ENSVG:AssetsPaths.OnBoarding1SVG,height:420,width: 420 ,text: "login_is_easy".tr,subtext: 'onboarding_description_1'.tr,btntext: 'start_btn'.tr));
  //   boardingList.add(BoardingModel(image: sharedPref!.getString('lang') == 'en'? AssetsPaths.OnBoarding2ENSVG:AssetsPaths.OnBoarding2SVG,height:349,width: 353 ,text: "view_invoices".tr,subtext: 'onboarding_description_2'.tr,btntext: 'next_btn'.tr));
  //   boardingList.add(BoardingModel(image:sharedPref!.getString('lang') == 'en' ? AssetsPaths.OnBoarding3ENSVG:AssetsPaths.OnBoarding3SVG,height:366,width: 349,text: "invoices_management".tr,subtext: 'onboarding_description_3'.tr,btntext: 'enter_btn'.tr));
  //   update();
  // }





}
