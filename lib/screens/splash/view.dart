import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/main.dart';
import 'package:moshtra/screens/login/view.dart';
import 'package:moshtra/utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../onboarding/view.dart';


late StreamSubscription<ConnectivityResult> subscription;
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {

  Future<void> watchNetworkState() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('=====Called onConnectivityChanged');
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        // I am connected to a mobile network.
        Timer(
            const Duration(seconds: 3),
                () {
              if (sharedPref!.getBool('onboarding') == null) {
                Get.offAll(() => OnBoardingScreen());
              }
              else {
                Get.offAll(() => LoginScreen());
              }
            }
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    watchNetworkState();
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }







  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: AppColors.blue,
  body: Padding(
    padding: const EdgeInsets.only(left: 36),
    child: Center(
      child:ElasticIn( duration: const Duration(milliseconds: 2000) ,child: SvgPicture.asset(AssetsPaths.MoshtraLogo,height:64.h,width: 284.w,)),
    ),
  ),
) ;





  }
}