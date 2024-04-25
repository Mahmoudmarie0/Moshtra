import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/cart_model.dart';
import '../../constants/colors.dart';
import '../../custom_text/view.dart';

class productsList extends StatelessWidget {

  List<Cart> cartList ;

  productsList(this.cartList);
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
              itemCount:cartList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)
              {
                return Container(
                  width: 150.w,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
                          ),
                          height: 200.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(cartList[index].image),

                          ),
                        ),
                      ),

                      SizedBox(height: 1.h,),
                      CustomText(text: cartList[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                      SizedBox(height: 5.h,),
                      CustomText(text: cartList[index].color as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                      SizedBox(height: 5.h,),
                      CustomText(text: cartList[index].price.toString()+' EGP',color:AppColors.blue,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

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
