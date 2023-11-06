import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController{
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







}