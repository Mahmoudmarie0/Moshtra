
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:moshtra/main.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/components.dart';
import '../../../Home_layout/view.dart';


class LoginController extends GetxController{
  bool oobscureText=true;
  var formKey = GlobalKey<FormState>();
  
  @override
  void onInit() {
    // TODO: implement onInit

    sharedPref!.setBool('onboarding', true);
    sharedPref!.setBool('HomeLayout', false);
    sharedPref!.setBool('Defenition', false);
    update();
    super.onInit();
  }
  
  
  void ontap(){
    oobscureText=!oobscureText;
    update();

  }


  void validateCredentials(String email, String password) {
    if(email.isEmpty || password.isEmpty)
      GetSnackbarError( message: 'Please Enter Your Email OR Password'.tr,Color: AppColors.Red);
    else {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password

      ).then((value) => {
        print("login success"),
        print(value.user!.email),
        print(value.user!.uid),

        if( value.user!.emailVerified){
          Get.to(HomeLayout()),}
        else{
          GetSnackbarError( message: " Please Verify Your Email".tr,Color: AppColors.Red),

          },

      }).catchError((error){
        print(error.toString());
        if(error is FirebaseAuthException && error.code=='invalid-email')
          GetSnackbarError( message: "The email address is badly formatted.".tr,Color: AppColors.Red);

        else {
          GetSnackbarError( message: "Wrong Password".tr,Color: AppColors.Red);
        }

      });

      // Perform login or other actions
    }
  }







}