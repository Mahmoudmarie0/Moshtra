
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'controller/Controller.dart';
class HomeScreen extends StatelessWidget {

  HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35,left: 16,right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 12,left: 8,right: 8),
                    child: TextField(

                     // controller: _searchController,
                      decoration: InputDecoration(

                        hintText: 'Search in Moshtra',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        fillColor: AppColors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  GetBuilder<HomeController>(

                    builder: (Controller)=>
                        ConditionalBuilder(
                            condition: Controller.categoriesModel!=null,

                            builder:(context)=>Controller.CategoryListView( Controller.categoriesModel!,Get.context!),
                            fallback: (context)=>Center(child: CircularProgressIndicator())
                        ),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:4),
              child: Container(
              width: 430.w,
              height: 550.h,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight:Radius.circular(22.r),topLeft: Radius.circular(22.r)),
              color: AppColors.white,),
                child: GetBuilder<HomeController>(
                  builder: (Controller)=>
                      ConditionalBuilder(
                          condition: Controller.homeModel!=null ,
                          builder:(context)=>Controller.products(Controller.homeModel!,Get.context!),
                          fallback: (context)=>Center(child: CircularProgressIndicator())
                      ),

                ),
              ),
            ),






          ],




        ),




    )


    ;
  }
}













