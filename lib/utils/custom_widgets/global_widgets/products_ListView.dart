import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Details/view.dart';

import '../../../models/cart_model.dart';
import '../../../screens/Home/controller/Controller.dart';
import '../../constants/colors.dart';
import '../../custom_text/view.dart';

class productsList extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  List<ProductModel> products ;

  ProductModel? model;

  productsList(this.products, [this.model]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount:products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)
              {
                return Container(
                  width: 150.w,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap:(){
                            String currentRoute = ModalRoute.of(context)!.settings.name ?? '';
                            if(currentRoute == '/DetailsScreen'){
                              homeController.addHistory(products[index]);
                              model = products[index];
                            }
                            else {
                              homeController.addHistory(products[index]);
                              Get.to(DetailsScreen(products[index]));
                            }

                            },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.white,
                            ),
                            height: 200.h,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(products[index]!.image!),

                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 1.h,),
                      CustomText(text:Get.locale?.languageCode == "en"? products[index].nameEN as String : products[index].nameAR as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                      SizedBox(height: 5.h,),
                      CustomText(text:Get.locale?.languageCode == "en"? products[index].sub_descriptionEN as String : products[index].sub_descriptionAR as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                      SizedBox(height: 5.h,),
                      CustomText(text: products[index].price.toString()+' EGP',color:AppColors.blue,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                    ],
                  ),
                );
              }, separatorBuilder: (context, index) { return SizedBox(width: 20.w,);},),
          ),
        ],
      ),
    );
  }
}
