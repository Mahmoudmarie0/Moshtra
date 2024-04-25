import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Categories/Electronic/controller/Controller.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';


class ElectronicsScreen  extends StatelessWidget {
  List<ProductModel> products = [];
  String catName;
  ElectronicsScreen(this.products,this.catName);




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectronicsController>(
      init: ElectronicsController(),
      builder: (controller) =>
      controller.loading.value ? Center(child: CircularProgressIndicator())
          : Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: CustomText(
                    text: catName,
                    fontSize: 18,
                    fontweight: FontWeight.w800,),
                ),
                SizedBox(height: 30.h,),
                GridViewElectronics(),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget GridViewElectronics() {
    return GetBuilder<ElectronicsController>(
      builder: (controller) =>
          Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade50,
                  shape: BoxShape.rectangle
              ),
              height: 700.h,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1/1.20,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0.5,

                ),

                itemCount: products.length,

                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width*.4,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:() {
                            Get.to(DetailsScreen(products[index]));
                          },
                          child:  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*.4,
                            height: 135.h,

                            child: Container(
                              height:138.h,
                              width: 160.w,
                              padding: const EdgeInsets.all(8.0),
                              child: Image .network(products[index].image as String),
                            ),
                          ),
                        ),
                        SizedBox(height: 9.h,),
                        CustomText(text: products[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, maxLine: 1,),
                        SizedBox(height: 5.h,),
                        CustomText(text: products[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                        SizedBox(height: 5.h,),
                        CustomText(text: products[index].price.toString()+' EGP',color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                      ],
                    ),
                  );
                },

              )
          ),
    );
  }
}