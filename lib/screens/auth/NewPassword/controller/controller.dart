import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/components.dart';
import '../../login/view.dart';



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
      Get.to(LoginScreen(),transition:  Transition.leftToRight);
      // Perform login or other actions
    }
  }









}