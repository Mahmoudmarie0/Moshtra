import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets.dart';

class NoConnectionView extends StatelessWidget {
  //onst NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        bool isConnected =
            connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
        return Future.value(isConnected);
        // return Future.value(true);
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withOpacity(.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.WifiLostSVG,fit: BoxFit.fitWidth,width: 200.w),
              SizedBox(height: 22.h,),
              Text('PLEASE CONNECT TO THE INTERNET',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:15.sp,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
