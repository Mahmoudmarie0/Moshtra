import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../global_controller/main_app_controller.dart';
import '../Chatbot/view.dart';
import '../OrderHistory/orderScreen.dart';
import '../auth/NewPassword/view.dart';
import 'controller/Controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({key});

  @override
  Widget build(BuildContext context) {
    final MainAppController mainAppController = Get.find();
    return GetBuilder<ProfileCopntroller>(
      init: ProfileCopntroller(),
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blue,
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 20, start: 20, end: 20),
                child: Get.locale?.languageCode == "en"
                    ? Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello,".tr + ' ${controller.userName}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                              Text(
                                  FirebaseAuth.instance.currentUser!.email
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white)),
                            ],
                          ),
                          Spacer(),
                          // InkWell(
                          //     onTap: () {
                          //       controller.logOutPopUp(Get.context);
                          //       // Get.to(LoginScreen(),transition: Transition.upToDown);
                          //     },
                          //     child: SvgPicture.asset(AssetsPaths.LogoutIcon)),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              height: 40.h,
                              width: 69.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'EN'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  SvgPicture.asset(AssetsPaths.language),
                                ],
                              ),
                            ),
                            onTap: () {
                              mainAppController.changeAppLang();
                            },
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              height: 40.h,
                              width: 69.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'EN'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  SvgPicture.asset(AssetsPaths.language),
                                ],
                              ),
                            ),
                            onTap: () {
                              mainAppController.changeAppLang();
                            },
                          ),
                          // InkWell(
                          //     onTap: () {
                          //       controller.logOutPopUp(Get.context);
                          //       // Get.to(LoginScreen(),transition: Transition.upToDown);
                          //     },
                          //     child: SvgPicture.asset(AssetsPaths.LogoutIcon)),
                          Spacer(),
                          Column(
                            crossAxisAlignment: Get.locale?.languageCode == "en"
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Text(
                                Get.locale?.languageCode == "en"
                                    ? "Hello".tr +
                                        ',' +
                                        ' ${controller.userName}'
                                    : ' ${controller.userName}' +
                                        ',' +
                                        "Hello".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                              Text(
                                  FirebaseAuth.instance.currentUser!.email
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white)),
                            ],
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 430.w,
                  height: 600.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),
                    color: AppColors.grayish_blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 12.h),

                        // shrinkWrap: true,
                        //   padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: Get.locale?.languageCode == "en"
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                "Personal_Information".tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.black),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                            AssetsPaths.ShippingAddressIcon),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          "Shipping_Address".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                        Spacer(),
                                        Text(
                                          "Shipping_Address".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        SvgPicture.asset(
                                            AssetsPaths.ShippingAddressIcon),
                                      ],
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(AssetsPaths.Profile),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          "Edit_your_profile".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                        Spacer(),
                                        Text(
                                          "Edit_your_profile".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        SvgPicture.asset(AssetsPaths.Profile),
                                      ],
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? InkWell(
                                onTap: () => Get.to(OrderScreen()),
                                child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetsPaths.OrderHistoryIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Order_History".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      ),
                                  )
                                  : InkWell(
                                onTap: () => Get.to(OrderScreen()),

                                child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Order_History".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          SvgPicture.asset(
                                              AssetsPaths.OrderHistoryIcon),
                                        ],
                                      ),
                                  ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              //
                              Text(
                                "Support_&_Information".tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.black),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              InkWell(
                                onTap: () async {
                                  final url =
                                      'https://docs.google.com/document/d/1N7Ploa5PLqshNt9n68DVjDn17IJy1GC7IU-R9O_K354/edit?usp=sharing';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Get.locale?.languageCode == "en"
                                    ? Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetsPaths.PrivacyPolicyIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Privacy_Policy".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Privacy_Policy".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          SvgPicture.asset(
                                              AssetsPaths.PrivacyPolicyIcon),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                            AssetsPaths.TermsConditionIcon),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          "Terms_&_Conditions".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                        Spacer(),
                                        Text(
                                          "Terms_&_Conditions".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        SvgPicture.asset(
                                            AssetsPaths.TermsConditionIcon),
                                      ],
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(AssetsPaths.FAQsIcon),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          "FAQs".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          size: 15,
                                          color: AppColors.grey4,
                                        ),
                                        Spacer(),
                                        Text(
                                          "FAQs".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey4),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        SvgPicture.asset(AssetsPaths.FAQsIcon),
                                      ],
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              //
                              Text(
                                "Account_Management".tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.black),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? InkWell(
                                      onTap: () => Get.to(NewPasswordScreen()),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetsPaths.ChangePassIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Change_Password".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () => Get.to(NewPasswordScreen()),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Change_Password".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          SvgPicture.asset(
                                              AssetsPaths.ChangePassIcon),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.deleteAccountPopUp(Get.context);
                                },
                                child: Get.locale?.languageCode == "en"
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            color: AppColors.placeholder,
                                          ),
                                          //SvgPicture.asset(AssetsPaths.ChangePassIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Delete_Account".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Delete_Account".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Icon(
                                            Icons.delete,
                                            color: AppColors.placeholder,
                                          ),
                                          //SvgPicture.asset(AssetsPaths.ChangePassIcon),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),

                              Get.locale?.languageCode == "en"
                                  ? InkWell(
                                      onTap: () {
                                        controller.logOutPopUp(Get.context);
                                        // Get.to(LoginScreen(),transition: Transition.upToDown);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            color: AppColors.placeholder,
                                          ),
                                          //SvgPicture.asset(AssetsPaths.ChangePassIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "LogOut".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.logOutPopUp(Get.context);
                                        // Get.to(LoginScreen(),transition: Transition.upToDown);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "LogOut".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Icon(
                                            Icons.logout,
                                            color: AppColors.placeholder,
                                          ),
                                          //SvgPicture.asset(AssetsPaths.ChangePassIcon),
                                        ],
                                      ),
                                    ),
                              // Row(
                              //   children: [
                              //     SvgPicture.asset(AssetsPaths.DarkThemeIcon),
                              //     SizedBox(width: 12.w,),
                              //     Text("Dark Theme",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                              //     Spacer(),
                              //     GetBuilder<ProfileCopntroller>(
                              //       init: ProfileCopntroller(),
                              //       builder: (controller)=> FlutterSwitch(
                              //         height: 20.h,
                              //         width: 29.33.w,
                              //         //  padding: 4.0,
                              //         toggleSize: 13.45,
                              //         borderRadius: 10.0,
                              //         activeColor: AppColors.orange,
                              //         value: controller.isToggled,
                              //         onToggle: (value) {
                              //
                              //           controller.OnSwitch(value);
                              //         },
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: AppColors.LightGrey,
                              ),

                              SizedBox(
                                height: 20.h,
                              ),
                              //
                              Text(
                                "Customer_Support".tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.black),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Get.locale?.languageCode == "en"
                                  ? GestureDetector(
                                      onTap: () => Get.to(ChatScreen()),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetsPaths.ChangePassIcon),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Technical_Support".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () => Get.to(ChatScreen()),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 15,
                                            color: AppColors.grey4,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Technical_Support".tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey4),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          SvgPicture.asset(
                                              AssetsPaths.ChangePassIcon),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height: 20.h,
                              ),
                              //
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ]));
      },
    );
  }
}
