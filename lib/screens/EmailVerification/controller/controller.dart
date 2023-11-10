import 'package:get/get.dart';
import 'package:moshtra/screens/login/view.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';

class EmailVerificationController extends GetxController {

  bool isCompleted = false;

  void onPinChanged(){
    isCompleted = false;
    update();
  }

  void onPinCompleted(){
    isCompleted = true;
    update();
  }

  void validateOTP() {
    if(isCompleted){
      Get.to(LoginScreen());
    }
    else
    {
        GetSnackbarError(
            message: 'Please Enter Your OTP Code', Color: AppColors.Red);
    }
  }
}