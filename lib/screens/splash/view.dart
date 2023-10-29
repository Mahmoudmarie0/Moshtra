import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/screens/onboarding/view.dart';
import 'package:moshtra/utils/constants/assets.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();


}




class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () {
          Get.to(OnBoarding());
        }
    );

  }



  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Center(

    child:BounceInUp( duration: const Duration(milliseconds: 2000) ,child: SvgPicture.asset(AssetsPaths.MoshtraLogo,height:64.h,width: 284.w,)),



  ),







) ;





  }
}