import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../global_controller/main_app_controller.dart';
import '../../main.dart';
import '../../utils/constants/assets.dart';
import '../auth/login/view.dart';
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
    sharedPref!.setBool('onboarding', false);
    sharedPref!.setBool('HomeLayout', false);
    sharedPref!.setBool('Defenition', true);
    update();






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
          width: 300.w,
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
          width: 300.w,
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






}
