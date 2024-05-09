
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import 'controller/controller.dart';

class NewPasswordScreen extends StatelessWidget {

  NewPasswordController newPasswordController=Get.put(NewPasswordController());

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController passordConfirmController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.only(left: 24,top: 90),
                  child: Text("New\nPassword".tr,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35.sp,color: AppColors.white),),
                ),
              ),
              Expanded(
                child:SvgPicture.asset(AssetsPaths.Ellipse,),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 36.5),
            child: Container(
              width: 375.w,
              height: 570.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight:Radius.circular(20.r),topLeft: Radius.circular(20.r)),
                color: AppColors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.only( left: 27,right: 27,top: 44),
                child: Container(
                  width:320.w ,
                  height:439.h ,
                  child: Column(
                    children: [
                      Container(
                        child: Text('Enter your new password and remember it.'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6F7384)
                          ),),
                      ),
                      SizedBox(height: 36.h,),
                      GetBuilder<NewPasswordController>(
                        init: NewPasswordController(),
                        builder: (controller)=>TextFormField (
                          controller:passwordController,

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.blue,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: GestureDetector(onTap: (){
                              controller.ontap();
                            },

                              child: Icon(controller.oobscureText?Icons.visibility:Icons.visibility_off_outlined),
                            ),
                            border:OutlineInputBorder(),
                            labelText: 'Password'.tr,
                           // hintText: 'Enter your password',
                            //hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                            //labelStyle: TextStyle(color: Colors.black),
                          ),
                          obscureText:controller.oobscureText,
                        ),

                      ),
                      SizedBox(height: 36.h,),
                      GetBuilder<NewPasswordController>(
                        init: NewPasswordController(),
                        builder: (controller)=>TextFormField (
                          controller:passordConfirmController ,

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.blue,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: GestureDetector(onTap: (){
                              controller.ontap();
                            },

                              child: Icon(controller.oobscureText?Icons.visibility:Icons.visibility_off_outlined),
                            ),
                            border:OutlineInputBorder(),
                            labelText: 'Confirm Password'.tr,
                           // hintText: 'Enter your password',
                           // hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                           // labelStyle: TextStyle(color: Colors.black),
                          ),
                          obscureText:controller.oobscureText,
                        ),

                      ),
                      SizedBox(height: 36.h,),
                      Container(
                        width: 319.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color:  AppColors.orange,
                        ),
                        child: MaterialButton(
                            onPressed: (){
                              String password=passwordController.text;
                              String passwordConfirm=passordConfirmController.text;
                              newPasswordController.validateNewPassword(password, passwordConfirm);

                              //  controller.onSubmit();
                            },
                            child: Text(
                              "Send".tr,
                              style: TextStyle(
                                color:  AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          )
        ],
      ),
    );
  }
}