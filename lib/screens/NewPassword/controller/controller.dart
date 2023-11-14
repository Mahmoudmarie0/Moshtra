import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/screens/login/view.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';


class NewPasswordController extends GetxController{
  bool oobscureText=true;
  var formKey = GlobalKey<FormState>();
  void ontap(){
    oobscureText=!oobscureText;
    update();
  }




  void validateNewPassword(String password,String confirmPassword) {
    if(password.isEmpty || confirmPassword.isEmpty)
      GetSnackbarError( message: 'Please Enter Password ',Color: AppColors.Red);
    else {
      GetSnackbarError( message: 'Your Password has been changed successfully ',Color: AppColors.Green);
      Get.to(LoginScreen());
      // Perform login or other actions
    }
  }









}