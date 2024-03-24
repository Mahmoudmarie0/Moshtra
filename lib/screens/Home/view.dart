
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Categories/view.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/screens/Home/widgets/ListViewProduct.dart';
import 'package:moshtra/screens/Home/widgets/ListviewCategory.dart';
import '../../models/products_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../../utils/custom_widgets/global_widgets/SearchField.dart';

class  HomeScreen extends StatelessWidget {

  ProductModel? model;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(

      init: HomeController(),

      builder:(controller)=>controller.loading.value ?Center(child: CircularProgressIndicator()): Scaffold(
        backgroundColor: AppColors.grayish_blue,
        body: Column(

          children:[
        
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 10,right: 10),
              child: Container(
                color: AppColors.grayish_blue,
                child: Column(
                  children: [
        
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: CustomText(
                        text: 'Welcome to',
                        color: AppColors.black,
                        fontSize: 20.sp,
                        fontweight: FontWeight.w500,
                      ),
                    ),
        
                    SizedBox(height: 5.h,),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: CustomText(
                        text: 'Moshtra',
                        color: AppColors.blue,
                        fontSize: 25.sp,
                        fontweight: FontWeight.w800,
                      ),
                    ),
        
                    SizedBox(height: 20.h,),
        
                    SearchTextFormField(),
        
                  ],
                ),
              ),
            ),
        
            SizedBox(height:  20.h),
        
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
        
                children: [
        
                  Column(
        
                  children: [
        
                  CarouselSlider(items: controller.bannerModel.map(
                      (e) =>
                      Container(
                        padding: EdgeInsets.only(left: 13,right: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            image:NetworkImage('${e.Image}'),
                            width: 400.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    initialPage: 0,
                    viewportFraction:1.0 ,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),),
        
                  SizedBox(height:15.h,),
        
                  Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                   children: [
                   CustomText(text: 'Categories',fontSize: 18,fontweight: FontWeight.w800,),
                    TextButton(onPressed: (){Get.to(CategoriesScreen());},
                    child:   CustomText(text: 'See All',fontSize: 16,fontweight: FontWeight.w500,color: AppColors.orange,),
                      )
                    ],
                  ),
                  ),
        
                 SizedBox(height: 5.h,),
        
                  ListViewCategory(),
        
                  SizedBox(height: 10.h,),
        
                  Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                     children: [
        
                      CustomText(text: 'Latest Products',fontSize: 18,fontweight: FontWeight.w800,),
        
                    ],
                  ),
               ),
        
                  SizedBox(height: 20.h,),
        
                  ListViewProduct(),
                        ],
                        ),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}