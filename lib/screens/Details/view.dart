import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

import 'controller/controller.dart';

class DetailsScreen extends StatelessWidget {


  ProductModel model;


  DetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.grey
                ),
                height: 290.h,
                width: double.infinity,
                child: Image.network(
                  model.image as String,
                  fit: BoxFit.contain,
                  width: 360.w,
                  height: 290.h ,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 24, right: 6),
                            width: 62.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: Color(0xff1f8bda),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text('Top Rated',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.white,
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            width: 81.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text('Free Shipping',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white,

                                ),),
                            ),
                          ),



                        ],
                      ),
                      SizedBox(height: 6.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(model.name as String ,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ), ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(model.price as String,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Text('Details:' ,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 10.h,),
                      Text(
                        model.description as String,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400),

                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Size',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  Text(model.Sized as String,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Color',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                        color: model.color
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70,),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 681),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60.h,
                      width: 160.w,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('Buy Now', style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.grey5,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Container(
                      width: 160.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.orange
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(onPressed: (){},
                            child: Text('Add To Cart',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SvgPicture.asset(AssetsPaths.MyCartWhite),
                        ],
                      ),
                    )
                  ],
                ),
              )//Buy button

            ],
          ),
        )
    );
  }
}
