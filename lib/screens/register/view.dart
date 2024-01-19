
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
    TextEditingController PasswordController = TextEditingController();
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
                    padding: const EdgeInsets.only( left: 27,right: 27,top: 0),
                    child: Container(
                      width:320.w ,
                      height:439.h ,
                      child: ListView(
                        children: [
                          TextFormField (


                            controller:nameController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              border:OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(15),
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                              ]
                          ),//name
                          SizedBox(height: 20.h,),
                          TextFormField (
                            keyboardType: TextInputType.emailAddress,

                            controller: emailController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              border:OutlineInputBorder(),
                              labelText: 'Email',

                            ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),

                              ]
                          ),//email
                          SizedBox(height: 20.h,),
                          TextFormField (
                            controller: phoneNumberController,

                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.phone),
                              prefixText: '+20',
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              border:OutlineInputBorder(),
                              labelText: 'Phone Number',

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly ,
                              ]
                          ),//phone number
                          SizedBox(height: 20.h,),
                          GetBuilder<LoginController>(

                            init: LoginController(),
                            builder: (controller)=>TextFormField (
                              keyboardType: TextInputType.visiblePassword,
                              controller: PasswordController,


                              decoration: InputDecoration(


                               // floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(onTap: (){
                                  controller.ontap();
                                },

                                  child: Icon(controller.oobscureText?Icons.visibility:Icons.visibility_off_outlined),
                                ),
                                border:OutlineInputBorder(),
                                labelText: 'Password',
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
                          SizedBox(height: 10.h,), //password_2
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
                                  String confirmPassword=PasswordController.text;

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
