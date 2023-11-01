import 'package:flutter/material.dart';
import 'package:moshtra/screens/onboarding/OnboardModel.dart';
import 'package:moshtra/screens/onboarding/controller.dart';
import 'package:moshtra/screens/onboarding/slideonboard.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:get/get.dart';
class OnBoarding extends GetView<controllonboarding> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(controllonboarding());
    return Scaffold(
      extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: SafeArea(child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.pagecontroller(value);

                  },
                  itemCount: onboardlist.length,
                  itemBuilder: (context,i){
                    return widgetslideonboard(int, i: i);
                  }),
            ),


          ],),
        ),

       );
   }
}