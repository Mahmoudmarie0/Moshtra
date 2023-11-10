
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/main.dart';
import 'package:moshtra/screens/HomeScreen/view.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
//mahm
class LoginController extends GetxController{
  bool oobscureText=true;
  var formKey = GlobalKey<FormState>();
  
  @override
  void onInit() {
    // TODO: implement onInit
    sharedPref!.setBool('onboarding', true);
    super.onInit();
  }
  
  
  void ontap(){
    oobscureText=!oobscureText;
    update();

  }

  void buttonFunction()
  {
    if(formKey.currentState!.validate()) {
    //  Get.offAll(() => OnBoarding());
    }
  }

  void validateCredentials(String email, String password) {
    if(email.isEmpty || password.isEmpty)
      GetSnackbarError( message: 'Please Enter Your Email OR Password',Color: AppColors.Red);
    else {
      Get.to(HomeScreen());
      // Perform login or other actions
    }
  }







}