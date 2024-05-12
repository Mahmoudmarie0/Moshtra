import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import 'controller/controller.dart';

class EmailVerification extends StatelessWidget {


  EmailVerificationController emailVetification = Get.put(EmailVerificationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerificationController>(
      builder : (controller) => Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: AppColors.blue,
        body:
        Column(
          children: [
            Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AssetsPaths.Ellipse)
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text('Email\nVerification'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(left: 10 , bottom: 10 , top: 30),
                      child:
                      Align(
                        alignment: Alignment.center,
                        child: Text('Conguratulation! Your Acoount Awaits; Verify Your Email \n to Start Shopping and Experience a World of Unrivaled \n Deals and Personalized Offers '.tr ,
                          style: TextStyle(
                            color: Color.fromRGBO(147, 150, 163 , 1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child:
                        ElevatedButton(
                          onPressed: () {
                           //  controller.verify();
                            // To New Password
                           // emailVetification.validateOTP();



                          },
                          child: Text('Verify'.tr , style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          style: button,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: (){
                          controller.resendVerificationEmail();
                          // print('Taped');
                        },
                        child: Text('Resend Email'.tr ,
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
