import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/login/view.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';

class CreatPasswordSuccesfully extends StatelessWidget {
  const CreatPasswordSuccesfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44.h,),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Container(
                  alignment: Alignment.center,
                  width: 328.w,
                  height: 408.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: AppColors.LightGreen,
                  ),
                  child: Image.asset(AssetsPaths.PassSucess)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                width: 328.w,
                height: 261.h,
                child:
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child:AnimatedTextKit(animatedTexts: [
                        FadeAnimatedText(
                            "New password set successfully",
                            textStyle:const TextStyle( fontSize: 25,fontWeight:FontWeight.w600,)

                        ),



                      ],


                      ),

                    ),
                    Expanded(
                      child: Text("Congratulations! Your password has been set successfully. Please proceed to the login screen to verify your account.",
                        style: TextStyle(
                            fontSize: 14.sp,fontWeight:FontWeight.w400,
                            color: Colors.grey.shade700  ),),
                    ),
                    Container(
                      width: 328.w,
                      height:50.h ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color:AppColors.black,
                      ),
                      child: MaterialButton(onPressed: (){
                        Get.to(LoginScreen());
                      },
                        child:
                        Text("Login") ,textColor: Colors.white,


                      ),
                    ),

                  ],
                ),

              ),



            ),



          ],





        ),


      ),

    );






  }
}
