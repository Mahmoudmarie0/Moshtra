import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import '../../EmailVerification/view.dart';

class EmailConfirmationController extends GetxController {

  void validateEmail(String email) {
    if (email.isEmpty)
      GetSnackbarError(
          message: 'Please Enter Your Email', Color: AppColors.Red);
    else {
      Get.to(EmailVerification());
    }
  }
}