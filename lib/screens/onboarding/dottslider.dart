import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/onboarding/controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/colors.dart';
import 'OnboardModel.dart';

class dottslider extends GetView<controllonboarding> {
  const dottslider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<controllonboarding>(builder: (controllonboarding){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothPageIndicator(
                    effect:  WormEffect(
                      activeDotColor:  AppColors.green,
                      dotHeight: 8.h,
                      dotColor: AppColors.grey,
                      dotWidth: 8.w,
                      spacing: 10.w,
                    ) ,
                    controller: controller.pageController,
                    count: 3,
              )
        ]);
      });
   }
}