
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:moshtra/screens/login/controller/controller.dart';
import 'package:moshtra/screens/register/view.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import 'controller/controller.dart';


class RegisterScreen extends StatelessWidget {
  //const RegisterScreen({super.key});
  RegisterController registerController=Get.put(RegisterController());
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController ConfirmpasswordController = TextEditingController();
    bool isChecked = false;
    return Scaffold(

       resizeToAvoidBottomInset: false,

      //resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.blue,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child:Padding(
                      padding: const EdgeInsets.only(left: 26,top: 112),
                      child: Text("Register",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 41.sp,color: AppColors.white),),
                    ),
                ),
                Expanded(
                    child:SvgPicture.asset(AssetsPaths.Ellipse,),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 45),
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
                      child: ListView(
                        children: [
                          TextFormField (

                            controller:nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            //  floatingLabelBehavior: FloatingLabelBehavior.always,
                              border:OutlineInputBorder(),
                              labelText: 'Name',
                             // hintText: 'ُEnter Your Name',
                              //hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                        //      labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),//name
                          SizedBox(height: 36.h,),
                          TextFormField (

                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              border:OutlineInputBorder(),
                              labelText: 'Email',
                             // hintText: 'Enter Your email',
                              //hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                             // labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),//email
                          SizedBox(height: 36.h,),
                          TextFormField (
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              border:OutlineInputBorder(),
                              labelText: 'Phone Number',
                             // hintText: 'Enter phone number',
                             // hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                             // labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),//phone number
                          SizedBox(height: 36.h,),
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller)=>TextFormField (
                              controller: ConfirmpasswordController,

                              decoration: InputDecoration(

                               // floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(onTap: (){
                                  controller.ontap();
                                },

                                  child: Icon(controller.oobscureText?Icons.visibility:Icons.visibility_off_outlined),
                                ),
                                border:OutlineInputBorder(),
                                labelText: 'Password',
                               // hintText: 'Your password, at least 8 character.',
                                //hintStyle: TextStyle(color: AppColors.LightGrey1,fontWeight:FontWeight.w300 ),
                                //labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.blue,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              obscureText:controller.oobscureText,
                            ),

                          ),//password_1
                          SizedBox(height: 15.h,), //password_2
                          // GetBuilder<RegisterController>(
                          //   init: RegisterController(),
                          //   builder:(controller)=> Row(
                          //     children: [
                          //       Checkbox(value:isChecked, onChanged: (bool ? value){
                          //         isChecked=value!;
                          //
                          //
                          //       },
                          //
                          //         checkColor:AppColors.white,
                          //
                          //       ),
                          //       Text(
                          //         'I agree to the Privacy Policy',
                          //         style: TextStyle(
                          //           decoration: TextDecoration.underline,
                          //           color: Colors.blue,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //
                          // ),
                          SizedBox(height: 18.h,),
                          Container(
                            width: 319.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color:  AppColors.orange,
                            ),
                            child: MaterialButton(
                                onPressed: (){
                                  String name=nameController.text;
                                  String email=emailController.text;
                                  String phoneNumber=phoneNumberController.text;
                                  String confirmPassword=ConfirmpasswordController.text;

                                  registerController.validateRegisterCredentials(name, email, phoneNumber, confirmPassword);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color:  AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp,
                                  ),
                                )
                            ),
                          ),//Register Button
                          SizedBox(height: 57.h,),


                        ],
                      ),
                    )
                  ),//form
                ),)
      ],
        ),
    );
  }
}
