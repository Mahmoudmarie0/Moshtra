

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/screens/Categories/Electronic/controller/Controller.dart';
import 'package:moshtra/screens/Categories/Electronic/electronics.dart';


import '../../utils/constants/colors.dart';


import '../../utils/custom_text/view.dart';
import 'controller/Controller.dart';

class CategoriesScreen extends StatelessWidget {

  final List<String> names = <String>['men', 's', 's', 's', 's'];


  //CategoriesController categoriesController=Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) =>
      controller.loading.value ? Center(child: CircularProgressIndicator())
          : Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container (
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Categories', fontSize: 18, fontweight: FontWeight.w800,),
              SizedBox(height: 10.h,),
              GridViewCategory(),


            ],
          ),
        ),
      ),
    );
  }

  Widget GridViewCategory() {
    return Expanded(
      child: SingleChildScrollView (
        child: GetBuilder <CategoryController>(
          builder: (controller) =>
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16.0),
                //   color: Colors.grey.shade50,
                //
                // ),
                  height: 700.h,
                  child: GridView.builder (
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 3.0
                      ),

                      itemCount: controller.categoryModel.length,

                      itemBuilder: (context, index) {
                       return Column(
                         children: [
                           GestureDetector(
                             onTap:() {
                               Get.to(ElectronicsScreen(controller.electronicsModel[index]));
                             },


                        child: Container(
                        height:130,
                        width: 150,
                         // decoration:BoxDecoration(borderRadius:BorderRadius.circular(50.r), ) ,
                        child: Image.network(controller.categoryModel[index].image as String,fit:BoxFit.fill,),
                        ),
                        ),
                        SizedBox(height: 9.h,),
                        CustomText(text: controller.categoryModel[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                        SizedBox(height: 10.h,),


                         ],
                       );
                      },

                  )
              ),
        ),
      ),
    );
  }
}


      // GetBuilder<CategoriesController>(
      // init: CategoriesController(),
      // builder : (controller)=>
      //     ListView.separated(
      //       itemBuilder: (context,index)=>controller.buildCatItem(controller.categoriesModel!.data!.data[index]),
      //       separatorBuilder: (context,index)=>MyDivider(),
      //       itemCount:controller.categoriesModel!.data!.data.length,
      //     ),
































