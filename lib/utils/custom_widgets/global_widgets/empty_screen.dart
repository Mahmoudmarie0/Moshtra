import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../screens/Home_layout/controller.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';

Widget buildEmptyScreen({String? titleText , String? subTitleText , String? btnText ,HomeLayoutController? homeLayoutController}) {
  return Scaffold(
    backgroundColor:AppColors.grayish_blue,
    body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsPaths.CartListEmpty),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(titleText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                subTitleText!,

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff6F7384),
                  height: 1.55,
                ),
              ),
            ),
            ElevatedButton(

                onPressed: () {
                  homeLayoutController!.SeeAll();

                  // Get.to(CategoriesScreen(),transition: Transition.upToDown);
                  // Go To Categories
                },
                style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size(328, 60),
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )
                ),
                child: Text(
                  btnText!,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                )
            ),
          ]
      ),
    ),
  );
}
