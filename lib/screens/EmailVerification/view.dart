import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:pinput/pinput.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/components.dart';
import 'controller/controller.dart';

class EmailVerification extends StatelessWidget {

  TextEditingController verificationController = TextEditingController();
  EmailVerificationController emailVetification = Get.put(EmailVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text('Email\nVerification' ,
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
                    child: Text('Enter the 5-digit verification code send to your\nemail address' ,
                      style: TextStyle(
                        color: Color.fromRGBO(147, 150, 163 , 1.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Pinput(
                          onChanged: (pin) {
                            emailVetification.onPinChanged();
                          },
                          onCompleted: (pin) {
                            emailVetification.onPinCompleted();
                          },
                          controller: verificationController,
                          length: 5,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          defaultPinTheme: PinTheme(
                            width: 65,
                            height: 65,
                            textStyle: TextStyle(
                              fontSize: 22,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.orange),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                          ),

                          submittedPinTheme: PinTheme(
                            width: 65,
                            height: 65,
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),

                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.Green),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: (){
                        // print('Taped');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t receive the code? ' ,
                            style: TextStyle(
                              color: AppColors.grey,
                            ),
                          ),
                          Text('Resend Code' ,
                            style: TextStyle(
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // To New Password
                          emailVetification.validateOTP();
                        },
                        child: Text('Verify' , style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        style: button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
