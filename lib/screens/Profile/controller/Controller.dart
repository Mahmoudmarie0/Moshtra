import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/main.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/custom_widgets/global_widgets/app_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/components.dart';
import '../../auth/login/view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCopntroller extends GetxController {
  bool isToggled = false;
  String? userName;

  Future<String?> getUsername() async {
    try {
      String currentUserEmail = FirebaseAuth.instance.currentUser!.email!;

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('Users')
              .where('email', isEqualTo: currentUserEmail)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();

        userName = userData['name'];
        print(userName);

        return userName;
      } else {
        print('User not found for email: $currentUserEmail');
        return null;
      }
    } catch (e) {
      print('Error getting username: $e');
      return null;
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    FirebaseAuth.instance.currentUser!.email.toString();
    launchURL;
   await getUsername();
    update();
  }

  OnSwitch(bool value) {
    isToggled = true;
    isToggled = value;
    update();
  }

  void navigateBack() {
    Get.back();
  }

  void deleteAccount() {
    FirebaseAuth.instance.currentUser!.delete();
    Get.to(LoginScreen());
  }

  Future logOutPopUp(context) async => await showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.ltr,
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r))),
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 279.w,
                height: 300.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppColors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Lottie.asset(AssetsPaths.Logout),
                              SizedBox(
                                height: 11.h,
                              ),
                              Text(
                                "Are you sure you \n want to log out? ".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 26.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: buttonWidget(
                                  text: 'Yes',
                                  width: 119.w,
                                  height: 33.h,
                                  radius: 26,
                                  onPress: () {
                                    sharedPref!.setBool('HomeLayout', false);
                                    sharedPref!.setBool('onboarding', true);
                                    Get.offAll(() => LoginScreen(),
                                        transition: Transition.downToUp);
                                  },
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.white,
                                  conColor: AppColors.orange,
                                )),
                                SizedBox(
                                  width: 7.h,
                                ),
                                Expanded(
                                    child: buttonWidget(
                                  text: 'No',
                                  width: 113.w,
                                  height: 33.h,
                                  radius: 26,
                                  onPress: () {
                                    navigateBack();
                                  },
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.black,
                                  conColor: AppColors.white,
                                )),
                                SizedBox(
                                  height: 33.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  // Future deleteAccountPopUp(context) async => await showDialog(
  //       context: context,
  //       builder: (context) => Directionality(
  //         textDirection: TextDirection.ltr,
  //         child: Dialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30.r))),
  //           backgroundColor: AppColors.white,
  //           child: Padding(
  //             padding: const EdgeInsets.all(12.0),
  //             child: Container(
  //               width: 279.w,
  //               height: 300.h,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(30.r),
  //                   color: AppColors.white),
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 14.h),
  //                 child: Column(
  //                   children: [
  //                     SizedBox(
  //                       height: 20.h,
  //                     ),
  //                     Expanded(
  //                       child: SingleChildScrollView(
  //                         child: Column(
  //                           children: [
  //                             Center(
  //                                 child:
  //                                     Lottie.asset(AssetsPaths.deleteAccount)),
  //                             SizedBox(
  //                               height: 11.h,
  //                             ),
  //                             Text(
  //                               "Are you sure you \n want to delete your account? ".tr,
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w600,
  //                                 color: AppColors.black,
  //                                 fontSize: 18.sp,
  //                               ),
  //                               textAlign: TextAlign.center,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.symmetric(
  //                           vertical: 5.h, horizontal: 26.w),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Expanded(
  //                                   child: buttonWidget(
  //                                 text: 'Yes',
  //                                 width: 119.w,
  //                                 height: 33.h,
  //                                 radius: 26,
  //                                 onPress: () {
  //                                   sharedPref!.setBool('HomeLayout', false);
  //                                   sharedPref!.setBool('onboarding', true);
  //                                   FirebaseAuth.instance.currentUser!.delete();
  //                                   GetSnackbarError(
  //                                       message:
  //                                           'Your account has been successfully deleted'.tr,
  //                                       Color: AppColors.green);
  //                                   Get.offAll(() => LoginScreen(),
  //                                       transition: Transition.downToUp);
  //                                 },
  //                                 fontWeight: FontWeight.w500,
  //                                 fontSize: 12,
  //                                 color: AppColors.white,
  //                                 conColor: AppColors.orange,
  //                               )),
  //                               SizedBox(
  //                                 width: 7.h,
  //                               ),
  //                               Expanded(
  //                                   child: buttonWidget(
  //                                 text: 'No',
  //                                 width: 113.w,
  //                                 height: 33.h,
  //                                 radius: 26,
  //                                 onPress: () async {
  //                                   // CollectionReference user = FirebaseFirestore.instance.collection('Users');
  //                                   // final  userQuery = await user.where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();
  //                                   // user.doc(userQuery.docs[0].id).delete();
  //                                   navigateBack();
  //                                 },
  //                                 fontWeight: FontWeight.w500,
  //                                 fontSize: 12,
  //                                 color: AppColors.black,
  //                                 conColor: AppColors.white,
  //                               )),
  //                               SizedBox(
  //                                 height: 33.h,
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  // Future deleteAccountPopUp(context) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (context) => Directionality(
  //       textDirection: TextDirection.ltr,
  //       child: Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(30.r)),
  //         ),
  //         backgroundColor: AppColors.white,
  //         child: Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Container(
  //             width: 279.w,
  //             height: 300.h,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(30.r),
  //               color: AppColors.white,
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(vertical: 14.h),
  //               child: Column(
  //                 children: [
  //                   SizedBox(
  //                     height: 20.h,
  //                   ),
  //                   Expanded(
  //                     child: SingleChildScrollView(
  //                       child: Column(
  //                         children: [
  //                           Center(child: Lottie.asset(AssetsPaths.deleteAccount)),
  //                           SizedBox(
  //                             height: 11.h,
  //                           ),
  //                           Text(
  //                             "Are you sure you \n want to delete your account? ".tr,
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.w600,
  //                               color: AppColors.black,
  //                               fontSize: 18.sp,
  //                             ),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 26.w),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Expanded(
  //                               child: buttonWidget(
  //                                 text: 'Yes',
  //                                 width: 119.w,
  //                                 height: 33.h,
  //                                 radius: 26,
  //                                 onPress: () async {
  //                                   try {
  //                                     // Get the current user's email
  //                                     String userEmail = FirebaseAuth.instance.currentUser!.email!;
  //
  //                                     // Delete the user's Firestore document
  //                                     CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //                                     QuerySnapshot userQuery = await users.where('email', isEqualTo: userEmail).get();
  //                                     if (userQuery.docs.isNotEmpty) {
  //                                       await users.doc(userQuery.docs[0].id).delete();
  //                                     }
  //
  //                                     // Delete the user's authentication account
  //                                     await FirebaseAuth.instance.currentUser!.delete();
  //
  //                                     // Show success message
  //                                     GetSnackbarError(
  //                                       message: 'Your account has been successfully deleted'.tr,
  //                                       Color: AppColors.green,
  //                                     );
  //
  //                                     // Delay for a short period to ensure the message is shown
  //                                     await Future.delayed(Duration(seconds: 2));
  //
  //                                     // Navigate to the login screen
  //                                     Get.offAll(() => LoginScreen(), transition: Transition.downToUp);
  //                                   } catch (e) {
  //                                     // Handle errors (e.g., show an error message)
  //                                     GetSnackbarError(
  //                                       message: 'Failed to delete account: ${e.toString()}'.tr,
  //                                       Color: AppColors.Red,
  //                                     );
  //                                   }
  //                                 },
  //                                 fontWeight: FontWeight.w500,
  //                                 fontSize: 12,
  //                                 color: AppColors.white,
  //                                 conColor: AppColors.orange,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 7.h,
  //                             ),
  //                             Expanded(
  //                               child: buttonWidget(
  //                                 text: 'No',
  //                                 width: 113.w,
  //                                 height: 33.h,
  //                                 radius: 26,
  //                                 onPress: () {
  //                                   navigateBack();
  //                                 },
  //                                 fontWeight: FontWeight.w500,
  //                                 fontSize: 12,
  //                                 color: AppColors.black,
  //                                 conColor: AppColors.white,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 33.h,
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future deleteAccountPopUp(context) async {
    return await showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
          ),
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 279.w,
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(child: Lottie.asset(AssetsPaths.deleteAccount)),
                            SizedBox(
                              height: 11.h,
                            ),
                            Text(
                              "Are you sure you \n want to delete your account? ".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 26.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: buttonWidget(
                                  text: 'Yes',
                                  width: 119.w,
                                  height: 33.h,
                                  radius: 26,
                                  onPress: () async {
                                    try {
                                      // Get the current user's email
                                      String userEmail = FirebaseAuth.instance.currentUser!.email!;

                                      // Delete all user's Firestore documents with the specified email
                                      QuerySnapshot userQuery = await FirebaseFirestore.instance.collection('Users').where('email', isEqualTo: userEmail).get();
                                      CollectionReference users = FirebaseFirestore.instance.collection('Users');
                                      for (QueryDocumentSnapshot doc in userQuery.docs) {
                                        await users.doc(doc.id).delete();
                                      }

                                      // Delete the user's authentication account
                                      await FirebaseAuth.instance.currentUser!.delete();

                                      // Show success message
                                      GetSnackbarError(
                                        message: 'Your account has been successfully deleted'.tr,
                                        Color: AppColors.green,
                                      );

                                      // Delay for a short period to ensure the message is shown
                                      await Future.delayed(Duration(seconds: 2));

                                      // Navigate to the login screen
                                      Get.offAll(() => LoginScreen(), transition: Transition.downToUp);
                                    } catch (e) {
                                      // Handle errors (e.g., show an error message)
                                      GetSnackbarError(
                                        message: 'Failed to delete account: ${e.toString()}'.tr,
                                        Color: AppColors.Red,
                                      );
                                    }
                                  },
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.white,
                                  conColor: AppColors.orange,
                                ),
                              ),
                              SizedBox(
                                width: 7.h,
                              ),
                              Expanded(
                                child: buttonWidget(
                                  text: 'No',
                                  width: 113.w,
                                  height: 33.h,
                                  radius: 26,
                                  onPress: () {
                                    navigateBack();
                                  },
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.black,
                                  conColor: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                height: 33.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  launchURL() async {
    const url =
        'https://docs.google.com/document/d/1N7Ploa5PLqshNt9n68DVjDn17IJy1GC7IU-R9O_K354/edit?usp=sharing';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      update();
    } else {
      throw 'Could not launch $url';
    }
  }
}
