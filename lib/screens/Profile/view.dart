
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';

import 'controller/Controller.dart';

class ProfileScreen extends StatelessWidget {
 //  ProfileScreen({super.key});
  ProfileCopntroller profileCopntroller=Get.put(ProfileCopntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blue,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(
                padding: const EdgeInsets.only(top: 52,left: 16,right: 16),
                child: Row(
                //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                     crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        Text("Hello,Ahmed",style: TextStyle(fontSize:16,fontWeight: FontWeight.w600 ,color: AppColors.white),),
                        Text("ahmeddraza@gmail.com",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500 ,color: AppColors.white)),
                      ],



                    ),
                    Spacer(),
                    InkWell(
                        onTap:(){
                          profileCopntroller.logOutPopUp(Get.context);
                         // Get.to(LoginScreen(),transition: Transition.upToDown);
                        } ,
                        child: SvgPicture.asset(AssetsPaths.LogoutIcon)),



                  ],

                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top:25 ),
                 child: Container(
                   width: 430.w,
                   height: 600.h,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(topRight:Radius.circular(20.r),topLeft: Radius.circular(20.r)),
                     color: AppColors.white,
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 12.h,),
                         Text("Personal Information",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: AppColors.black ),),
                         SizedBox(height:24.h ,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.ShippingAddressIcon),
                             SizedBox(width: 12.w,),
                             Text("Shipping Address",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.PaymentMethodIcon),
                             SizedBox(width: 12.w,),
                             Text("Payment Method",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.OrderHistoryIcon),

                             SizedBox(width: 12.w,),
                             Text("Order History",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 20.h,),
                         //
                         Text("Support & Information",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: AppColors.black ),),
                         SizedBox(height:24.h ,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.PrivacyPolicyIcon),
                             SizedBox(width: 12.w,),
                             Text("Privacy Policy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.TermsConditionIcon),
                             SizedBox(width: 12.w,),
                             Text("Terms & Conditions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.FAQsIcon),

                             SizedBox(width: 12.w,),
                             Text("FAQs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 20.h,),
                         //
                         Text("Account Management",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: AppColors.black ),),
                         SizedBox(height:24.h ,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.ChangePassIcon),
                             SizedBox(width: 12.w,),
                             Text("Change Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             Icon(Icons.arrow_forward_ios,size: 15,color:AppColors.grey4 ,),
                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             SvgPicture.asset(AssetsPaths.DarkThemeIcon),
                             SizedBox(width: 12.w,),
                             Text("Dark Theme",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.grey4 ),),
                             Spacer(),
                             GetBuilder<ProfileCopntroller>(
                             init: ProfileCopntroller(),
                               builder: (controller)=> FlutterSwitch(
                                 height: 20.h,
                                 width: 29.33.w,
                               //  padding: 4.0,
                                 toggleSize: 13.45,
                                 borderRadius: 10.0,
                                 activeColor: AppColors.orange,
                                 value: controller.isToggled,
                                 onToggle: (value) {

                                   controller.OnSwitch(value);
                                 },
                               ),

                             ),

                           ],




                         ),
                         SizedBox(height: 8.h,),
                         Divider(
                           height: 1,
                           thickness: 1,
                           indent: 0,
                           endIndent: 0,
                           color: AppColors.LightGrey,
                         ),











                       ],





                     ),
                   ),

                 ),
               ),







            ]
        ));
  }
}