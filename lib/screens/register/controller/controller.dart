import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import '../../Home_layout/view.dart';


class RegisterController extends GetxController{
  bool oobscureText=true;
  var formKey = GlobalKey<FormState>();




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


  void validateRegisterCredentials(String name, String email,String phoneNumber,String confirmPassword) {
    if(name.isEmpty||email.isEmpty || phoneNumber.isEmpty || confirmPassword.isEmpty)
      GetSnackbarError( message: 'Please fill in all fields ',Color: AppColors.Red);
    else {
      GetSnackbarError( message: 'Your account has been created successfully ',Color: AppColors.Green);
      Get.to(HomeLayout());
      // Perform login or other actions
    }
  }

   onChange(bool value){
  //  isChecked=!value;
    update();
  }







}