import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:moshtra/main.dart';
import 'package:moshtra/screens/EmailConfirmation/view.dart';
import 'package:moshtra/screens/login/controller/controller.dart';
import 'package:moshtra/screens/register/view.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';




class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  LoginController loginController=Get.put(LoginController());



  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26,top: 112),
                child: Text("Login",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 48.sp,color: AppColors.white),),
              ),
              SizedBox(width: 24.w,),
              SvgPicture.asset(AssetsPaths.Ellipse,),

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
                  child:  Column(

                    children: [
                      TextFormField (
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email_sharp),
                           // floatingLabelBehavior: FloatingLabelBehavior.always,
                            border:OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.blue,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                            labelText: 'Email',
                        ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),

                          ]
                      ),
                      SizedBox(height: 20.h,),
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller)=>TextFormField (
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,

                          decoration: InputDecoration(

                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: GestureDetector(onTap: (){
                                controller.ontap();
                                },

                                child: Icon(controller.oobscureText?Icons.visibility:Icons.visibility_off_outlined),
                              ),
                            border:OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.blue,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Password',

                          ),
                          obscureText:controller.oobscureText,
                        ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        TextButton(
                            style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                            ),

                            onPressed: (){
                              Get.to(EmailConfirmation());
                        }, child:
                        Text("Forgot Password?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:AppColors.LightGrey1 ),)

                        ),
                        ],
                      ),
                      SizedBox(height: 20.h,),

                      buttonWidget(
                          text: "Login",
                          width: 319,
                          height: 50,
                          radius: 50,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          onPress: (){
                             sharedPref!.setBool('login', true);
                           //   controller.onSubmit();
                          },
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Don’t have an account yet? ",style: TextStyle(fontSize: 12.sp,color:Colors.black,fontWeight:FontWeight.w300),),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 10),
                                alignment: Alignment.centerLeft,
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: (){

                              Get.to(RegisterScreen(),transition:  Transition.leftToRight);
                            },
                            child:
                          Text("Register Here",style: TextStyle(fontSize:12.sp,fontWeight: FontWeight.w800,color: AppColors.orange),),
                          ),
                        ],
                      ),
                      SizedBox(height: 29.h,),
                      SvgPicture.asset(AssetsPaths.OrLoginWith),
                      SizedBox(height: 16.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetsPaths.Google),
                          SvgPicture.asset(AssetsPaths.Facebook),
                          SvgPicture.asset(AssetsPaths.Apple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonWidget extends StatelessWidget {
  final String text;
  final int width;
  final int height;
  final int radius;
  final Function onPress;
  final FontWeight fontWeight;
  final int fontSize;


  const buttonWidget({
    Key? key, required this.text, required this.width, required this.height, required this.radius, required this.onPress, required this.fontWeight, required this.fontSize,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),//BorderRadius.circular(50.r),
        color: AppColors.orange,
      ),
      child: MaterialButton(
          onPressed: (){
            onPress;

          // sharedPref!.setBool('login', true);
            //  controller.onSubmit();
          },
          child: Text(
            //"Login",
            text,
            style: TextStyle(
              color:  AppColors.white,
              fontWeight:fontWeight, //FontWeight.w500,
              fontSize: fontSize.sp,//17.sp,
            ),
          )
      ),
    );
  }
}

