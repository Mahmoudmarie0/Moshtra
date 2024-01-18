
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/main.dart';


import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import '../../Home_layout/view.dart';
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


  void validateCredentials(String email, String password) {
    if(email.isEmpty || password.isEmpty)
      GetSnackbarError( message: 'Please Enter Your Email OR Password',Color: AppColors.Red);
    else {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password

      ).then((value) => {
        print("login success"),
        print(value.user!.email),
        print(value.user!.uid),
      Get.to(HomeLayout()),

      }).catchError((error){
        print(error.toString());
        if(error is FirebaseAuthException && error.code=='invalid-email')
          GetSnackbarError( message: "The email address is badly formatted.",Color: AppColors.Red);

        else {
          GetSnackbarError( message: "Wrong Password",Color: AppColors.Red);
        }

      });

      // Perform login or other actions
    }
  }







}