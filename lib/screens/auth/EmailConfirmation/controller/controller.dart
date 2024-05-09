import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/components.dart';



class EmailConfirmationController extends GetxController {

  void validateEmail(String email) {
    if (email.isEmpty) {
      GetSnackbarError(
          message: 'Please Enter Your Email'.tr, Color: AppColors.Red);

      return;
    }
    // else {
    //   Get.to(EmailVerification(),transition:  Transition.leftToRight);
    // }
  }
}