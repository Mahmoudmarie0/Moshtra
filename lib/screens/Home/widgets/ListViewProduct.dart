
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../models/fav_product_model.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/custom_text/view.dart';
import '../../Details/view.dart';
import '../../Wishlist/database/fav_view_model.dart';
import '../../Wishlist/view.dart';
import '../controller/Controller.dart';

ListViewProduct() {
  return GetBuilder<HomeController>(
    builder:(controller)=> GridView.builder(
      padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1/1.20,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 0.5,

        ),
        itemCount: controller.productModel.length,
        itemBuilder: (context,index){
          return Container(
            width: MediaQuery.of(context).size.width*.4,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(DetailsScreen(controller.productModel[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,

                    ),

                    width: MediaQuery.of(context).size.width*.4,
                    height: 135.h,

                    child: Container(
                      height:138.h,
                      width: 160.w,


                      child: Stack(
                          alignment: Alignment.center,

                          children:[

                            Image.network(controller.productModel[index].image as String,fit:BoxFit.cover,width: 100,),

                            GetBuilder<FavViewModel>(
                              init: Get.put(FavViewModel()),
                              builder: (controller2) => Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      onTap: (){
                                        controller2.addProduct(
                                            FavProductModel(
                                                name: controller.productModel[index].name,
                                                price: controller.productModel[index].price,
                                                image: controller.productModel[index].image,
                                                productId: controller.productModel[index].productId
                                            )
                                        );
                                        showSnackBarFun(context);
                                        print("done");

                                      },
                                      child: SvgPicture.asset(AssetsPaths.FavIcon,fit: BoxFit.fill,))),
                            ),

                          ]


                      ),
                    ),
                  ),
                ),
                SizedBox(height: 9.h,),
                CustomText(text: controller.productModel[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                SizedBox(height: 5.h,),
                CustomText(text: controller.productModel[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                SizedBox(height: 5.h,),
                CustomText(text: controller.productModel[index].price.toString()+' EGP',color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),


              ],
            ),
          );



        }),
  );
}
showSnackBarFun(context){
  SnackBar snackBar = SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      duration: Duration.millisecondsPerSecond.milliseconds,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: AppColors.white,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 200,
          left: 15,
          right: 15
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.task_alt_rounded,
                color: AppColors.Green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'The product has been added to\nyour Favorite',
                style: TextStyle(
                  color: AppColors.black,
                ),
              )
            ],
          ),
          GestureDetector(
            child: Text('View Favorite'
              ,style: TextStyle(
                  color: AppColors.orange
              ),
            ),
            onTap: (){ Get.to(MyFavScreen()); },
          )
        ],
      )

  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}