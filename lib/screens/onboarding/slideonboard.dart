import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/onboarding/controller.dart';
import 'package:moshtra/screens/onboarding/dottslider.dart';

import '../../utils/constants/colors.dart';
import '../login/view.dart';
import 'OnboardModel.dart';

class widgetslideonboard extends GetView<controllonboarding> {
  final int i;
  widgetslideonboard(Type int, {Key? key,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(controllonboarding());
    return Column(
      children: [
        SizedBox(height: 55.h,),
        Container(

          decoration: BoxDecoration(borderRadius:BorderRadius.circular(32.r),color:AppColors.LightGreen ),
          width:289.w,
          height: 408.h,
          
          child:Column(
          
            children: [
              Row(
                children: [
                  IconButton(

                      color: Color(0xFF323232),
                      icon: Icon(
                        Icons.arrow_back,

                      ),
                      onPressed: () {
                        controller.back();

                      }
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {

                      Get.to(LoginScreen());
                    },

                    child: Text(
                      "Skip For Now",
                      style: TextStyle(
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ],


              ),
              SizedBox(height:46.h,),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset((onboardlist[i].image),width:240.w ,height: 240.h,)
                  ]),
              
              
            ],
        
           ),


        
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                  width: 328.w,
                  height: 261.h,
                  child:
                  Column(
                    children: [
                      Expanded(

                        child:AnimatedTextKit(animatedTexts: [
                          FadeAnimatedText(
                            onboardlist[i].title,
                            textStyle:const TextStyle( fontSize: 25,fontWeight:FontWeight.w600,)

                          ),



                        ],


                        ),

                        ),
                      Expanded(
                              child: Text(onboardlist[i].body,
                                style: TextStyle(
                                    fontSize: 14.sp,fontWeight:FontWeight.w400,
                                    color: Colors.grey.shade700  ),),
                            ),
                      Container(
                        width: 328.w,
                        height:50.h ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color:AppColors.black,
                        ),
                        child: MaterialButton(onPressed: (){
                          controller.next();
                        },
                          child:
                          Text("Next") ,textColor: Colors.white,


                        ),
                      ),
                      SizedBox(height:30.h,),
                      dottslider(),
                          ],
                      ),

                ),



                  ),

                  ],

              )
          ],);









    }
}