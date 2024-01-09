import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../global_controller/main_app_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'model.dart';

// Hello jOOO


class OnBoardingScreen extends StatelessWidget {
  //OnBoardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());
  final MainAppController mainAppController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor:AppColors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SvgPicture.asset(AssetsPaths.OnBoarding,height: 305.h ,width:470.w,),
          GetBuilder<OnboardingController>(
            builder: (controller)
            {
              return PageView.builder(itemBuilder: (context,index) => buildOnBoardItem(controller.boardingList[index]),
                itemCount: controller.boardingList.length,
                controller: controller.boardController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  controller.onPageChange(index);
                },
              );
            },
          ),
          Positioned(
            top: 770.h,
            left: 166.w,
            child: Center(
              child: SmoothPageIndicator(
                effect:  WormEffect(
                  activeDotColor:  AppColors.blue,
                  dotHeight: 8.h,
                  dotColor: AppColors.lightblue,
                  dotWidth: 8.w,
                  spacing: 10.w,
                ) ,
                controller: controller.boardController,
                count: 3,
              ),
            ),
          ),

        ],
      ),
    );
  }



  Widget buildOnBoardItem(BoardingModel model) => Stack(
    alignment: Alignment.topLeft,
    children: [
      FadeInLeft(
        from: 150,
        duration: const Duration(milliseconds: 1300),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 290.h,),
              Stack(

                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(model.image,height: model.height.h ,width: model.width.w,fit: BoxFit.cover,),
                ],
              ),
            ],
          ),
        ),
      ),

      Positioned(
        top: 600.h,
        left: 20,
        child: SizedBox(
          width: 335.w,
          height: 150.h,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.h,),
              Expanded(
                child: Text(model.text,style: TextStyle(
                  fontWeight: FontWeight.w500,fontSize:20.sp,color:  AppColors.black,
                ),),
              ),
              Expanded(
                child: Text(model.subtext
                  ,style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize:10.sp,
                    color:  AppColors.black,
                  )
                  ,textAlign: TextAlign.center,),
              ),
              Expanded(
                child: Container(
                  width: 319.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color:  AppColors.orange,
                  ),
                  child: MaterialButton(
                      onPressed: (){
                        controller.onSubmit();
                      },

                      child: Text(
                        model.btntext,
                        style: TextStyle(
                          color:  AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      )
                  ),
                ),
              ),
            ],
          ) ,
        ),
      ),
      SizedBox(height: 40.h,),
    ],
  );

}