
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:moshtra/utils/constants/colors.dart';
// import 'controller/Controller.dart';
// class HomeScreen extends StatelessWidget {
//
//   HomeController homeController=Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.blue,
//         resizeToAvoidBottomInset: false,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 35,left: 16,right: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12,left: 8,right: 8),
//                     child: TextField(
//
//                      // controller: _searchController,
//                       decoration: InputDecoration(
//
//                         hintText: 'Search in Moshtra',
//                         prefixIcon: Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//
//                         ),
//                         fillColor: AppColors.white,
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   GetBuilder<HomeController>(
//                     builder: (Controller)=>
//                         ConditionalBuilder(
//                             condition: Controller.categoriesModel!=null,
//                             builder:(context)=>Controller.CategoryListView( Controller.categoriesModel!,Get.context!),
//                             fallback: (context)=>Center(child: CircularProgressIndicator())
//                         ),
//
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top:4),
//               child: Container(
//               width: 430.w,
//               height: 550.h,
//               decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topRight:Radius.circular(22.r),topLeft: Radius.circular(22.r)),
//               color: AppColors.white,),
//                 child: GetBuilder<HomeController>(
//                   builder: (Controller)=>
//                       ConditionalBuilder(
//                           condition: Controller.homeModel!=null ,
//                           builder:(context)=>Controller.products(Controller.homeModel!,Get.context!),
//                           fallback: (context)=>Center(child: CircularProgressIndicator())
//                       ),
//
//                 ),
//               ),
//             ),
//
//
//
//
//
//
//           ],
//
//
//
//
//         ),
//
//
//
//
//     )
//
//
//     ;
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/utils/constants/assets.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';

class HomeScreen extends StatelessWidget {

 final List<String> names=<String>['men','s','s','s','s'];
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller)=>controller.loading.value ?Center(child: CircularProgressIndicator()): Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(

          padding: EdgeInsets.only(top:60,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SearchTextFormField(),
              SizedBox(
                height: 35,
              ),
              CustomText(text: 'Categories',fontSize: 18,fontweight: FontWeight.w800,),
              SizedBox(height: 30.h,),
              ListViewCategory(),
              SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                CustomText(text: 'Best Selling',fontSize: 18,fontweight: FontWeight.w800,),
                CustomText(text: 'See All',fontSize: 16,fontweight: FontWeight.w400,color: AppColors.orange,),





              ],




            ),
              SizedBox(height: 30.h,),
             ListViewProduct(),
            ],
          ),
        ),


      ),
    );
  }

  Widget SearchTextFormField() {
      return  Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.grey.shade200,
),
child: TextFormField(
  decoration: InputDecoration(
    border: InputBorder.none,
    prefixIcon: Icon(Icons.search,color: Colors.black,),
    label:CustomText(text: 'Search in Moshtra',fontSize: 18,fontweight: FontWeight.w300,color: AppColors.grey,),


  ),
),
);

  }

  Widget ListViewCategory() {
    return GetBuilder<HomeController>(
      builder:(controller)=> Container(
        height: 100.h,
        child: ListView.separated(
          itemCount:controller.categoryModel.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,

                  ),
                  height: 60.h,
                  width: 60.w,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image .network(controller.categoryModel[index].image as String),
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

  ListViewProduct() {
    return GetBuilder<HomeController>(
      builder:(controller)=> Container(
        height: 350.h,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Container(
              width: MediaQuery.of(context).size.width*.4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,

                    ),

                    width: MediaQuery.of(context).size.width*.4,

                    child: Container(
                      height:220,
                        child: Image.network(controller.productModel[index].image as String,fit:BoxFit.fill ,),
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  CustomText(text: controller.productModel[index].name as String,alignment: Alignment.bottomLeft,fontweight: FontWeight.w600 ),
                  SizedBox(height: 9.h,),
                  CustomText(text: controller.productModel[index].description as String,alignment: Alignment.bottomLeft,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 2,),
                  SizedBox(height: 5.h,),
                  CustomText(text: controller.productModel[index].price.toString() as String,color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.bottomLeft,),


                ],
              ),
            );



          }, separatorBuilder: ( context,  index) =>SizedBox(
          width: 20,
        ),



        ),
      ),
    );
  }


}















