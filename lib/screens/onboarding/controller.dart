import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/login/view.dart';
import 'package:moshtra/screens/onboarding/OnboardModel.dart';

class controllonboarding extends GetxController {
  late PageController pageController;

  int curpage = 0;

  bool islast=false;

  pagecontroller(int index) {
    curpage = index;
    update();
  }

  next() {
      if(curpage==onboardlist.length-1) {
         Get.offAll(()=>LoginScreen());
               }
      else{
            curpage++;
            pageController.animateToPage(curpage, duration: Duration(milliseconds: 650), curve: Curves.easeInCubic);
                }
  }

  back() {
    curpage--;
    pageController.animateToPage(curpage,
        duration: Duration(milliseconds: 700), curve: Curves.easeInCubic);

  }

  @override
  void onInit() {
    pageController = PageController();
    // TODO: implement onInit
    super.onInit();
    }
}