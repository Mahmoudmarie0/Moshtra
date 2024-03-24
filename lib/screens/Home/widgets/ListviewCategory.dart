
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../utils/constants/colors.dart';
import '../controller/Controller.dart';

Widget ListViewCategory() {
  return GetBuilder<HomeController>(
    builder:(controller)=> Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      height: 100.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount:4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Column(
            children: [
              SingleChildScrollView(
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,

                  ),
                  height: 60.h,
                  width: 76.w,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image as String),
                  ),
                ),
              ),

              SizedBox(height: 1.h,),
              Text(controller.categoryModel[index].name as String,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 10.sp,color: AppColors.black),),
            ],
          );



        }, separatorBuilder: ( context,  index) =>SizedBox(
        width: 20,
      ),



      ),
    ),
  );
}