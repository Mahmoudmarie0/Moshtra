import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:moshtra/screens/login/controller/controller.dart';
import 'package:moshtra/screens/register/view.dart';
import '../../main.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../create_password/view.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  LoginController loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(height: 110.h,),
          Form(
            key: loginController.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left:22,right:22, ),
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                width:331.w,
                height:650.h,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(style: TextStyle(fontWeight:FontWeight.w700,fontSize:28.sp,color: AppColors.black),child: Text("Welcome back!")),
                    SizedBox(height: 40.h,),
                    Container (
                      width: 331.w,
                      height: 350.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",style: TextStyle(fontWeight:FontWeight.w700,fontSize:14.sp,color:AppColors.black),),
                          SizedBox(height: 16.h,),
                          Container(
                            width: 331.w,
                            height: 50.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.LightGrey),
                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                 Get.snackbar('Error', 'Please Enter Your Email Or Password');
                                }
                                else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email..',
                                border: InputBorder.none,
                              ),


                            ),

                          ),
                          SizedBox(height: 16.h,),
                          Text("Password",style: TextStyle(fontWeight:FontWeight.w700,fontSize:14.sp,color:AppColors.black),),
                          SizedBox(height: 16.h,),
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller)=> Container(
                              width: 331.w,
                              height: 50.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.LightGrey),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                textAlign: TextAlign.left,


                                decoration: InputDecoration(
                                  hintText: 'Enter Your Password..',
                                  errorText: null,

                                  suffixIcon: GestureDetector(onTap: (){
                                    controller.ontap();
                                  },

                                    child: Icon(controller.oobscureText?Icons.visibility
                                        :Icons.visibility_off_outlined),
                                  ),


                                  border: InputBorder.none,
                                ),
                                obscureText:controller.oobscureText,
                                validator: (value){
                                  if(value!.isEmpty){

                                      return "Please Enter Your Password" ;
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),

                          ),
                          SizedBox(height: 30.h,),
                          Container(
                            width: 331.w,
                            height:50.h ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color:AppColors.black,
                            ),
                            child: MaterialButton(onPressed: (){
                              {
                                if(loginController.formKey.currentState!.validate())
                                {
                                  //FocusManager.instance.primaryFocus?.unfocus();
                                  loginController.buttonFunction();

                                }
                              }
                            },
                              child:
                              Text("SIGN IN",style: TextStyle(fontWeight:FontWeight.w700 ),) ,textColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          Center(child: TextButton(onPressed: (){
                            Get.to(CreatePassword());
                          }, child: Text("Forgot password?",style: TextStyle(fontWeight: FontWeight.w700,fontSize:16.sp,color: AppColors.DarkGreen),))),
                        ],
                      ),
                    ),
                    SizedBox(height: 42.5.h,),
                    Container(
                      width: 195.w,
                      height: 81.h,
                      child: Column(
                        children: [
                          SvgPicture.asset(AssetsPaths.Line),
                          SizedBox(height: 12.h,),
                          Container(
                            width: 152.w ,
                            height: 44.h ,
                            child: Row(
                              children: [
                                SvgPicture.asset(AssetsPaths.Google),
                                SizedBox(width: 10.w,),
                                SvgPicture.asset(AssetsPaths.Facebook),
                                SizedBox(width: 10.w,),
                                SvgPicture.asset(AssetsPaths.Apple),





                              ],



                            ),


                          ),








                        ],




                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?",style: TextStyle(color: AppColors.LightGrey1),),
                        TextButton(onPressed: (){
                          Get.to(()=>Home());
                        }, child: Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.w700,fontSize:16.sp,color: AppColors.DarkGreen),)),




                      ],



                    ),
                  ],



                ),
              ),
            ),
          ),



        ],





      ),

    );
  }
}

