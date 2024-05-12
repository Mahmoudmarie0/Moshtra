import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/components.dart';
import '../../../Home_layout/view.dart';


class EmailVerificationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setTimerForAutoReDirect();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void resendVerificationEmail() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null && user.emailVerified) {
        GetSnackbarError(
          message: 'Your account has been created successfully '.tr,
          Color: AppColors.Green,
        );
        Get.offAll(HomeLayout()); // Navigate to the home screen
      }
    });

    FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  setTimerForAutoReDirect() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified == true) {
        timer.cancel();
        Get.to(HomeLayout());
      }
    });
  }
  // void onPinChanged(){
  //   isCompleted = false;
  //   update();
  // }
  //
  // void onPinCompleted(){
  //   isCompleted = true;
  //   update();
  // }
  //
  // void validateOTP() {
  //   if(isCompleted){
  //     Get.to(NewPasswordScreen(),transition:  Transition.leftToRight);
  //   }
  //   else
  //   {
  //       GetSnackbarError(
  //           message: 'Please Enter Your OTP Code', Color: AppColors.Red);
  //   }
  //   isCompleted=false;
  // }
}
