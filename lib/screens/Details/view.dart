import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:moshtra/screens/Details/Components/bulletTabs.dart';

import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';

class DetailsScreen extends StatefulWidget {



  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemCount = 1;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
              ),
              height: 290.h,
              width: double.infinity,
              child: Image.asset(
                AssetsPaths.Watch,
                fit: BoxFit.contain,
                width: 360.w,
                height: 290.h,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 230, left: 147),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
              width: 66.w,
              height: 16.h,
              child: BulletTabs(),
            ),
            


            Container(
              margin: EdgeInsets.only(top: 250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 600.h,
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

                            ),),
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
                        Text('Loop Silicone Strong\nMagnetic watch',style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$15.25",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "\$20.00",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6.h,),
                    SvgPicture.asset(AssetsPaths.Rating),
                    SizedBox(height: 10.h,),
                    Text('Constructed with high-quality silicone material,'
                        ' the Loop Silicone Strong Magnetic Watch ensures a'
                        ' comfortable and secure fit on your wrist.'
                        ' The soft and flexible silicone is gentle on the skin,'
                        ' making it ideal for extended wear. '
                        'Its lightweight design allows for a seamless blend of comfort and durability.'
                        ' One of the standout features of this watch band is its strong magnetic closure.'
                        ' The powerful magnets embedded within the band provide a secure and reliable connection,'
                        ' ensuring that your smartwatch stays firmly in place throughout the day. '
                        'Say goodbye to worries about accidental detachment or slippage - the magnetic closure offers a peace of mind for active individuals on the go. '
                        'The Loop Silicone Strong Magnetic Watch Band is highly versatile,'
                        ' compatible with a wide range of smartwatch models. '
                        'Its adjustable strap length allows for a customizable fit,'
                        ' catering to various wrist sizes.'
                        ' Whether you\'re engaging in intense workouts or attending formal occasions,'
                        ' this watch band effortlessly adapts to your style and activity level.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),maxLines: 5,
                    overflow: TextOverflow.ellipsis,),
                    Text('Read more',style: TextStyle(fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff08e488)),),
                    SizedBox(height: 3.h,),
                    Text('Color',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                    SvgPicture.asset(AssetsPaths.GroupColor2),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Quantity',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),

                    Row(
                      children: [
                        Container(

                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: (){


                                    if(itemCount > 1) {
                                      itemCount--;
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(

                                    Icons.remove,
                                    color: Colors.grey,
                                  )),
                              Text(
                                "${itemCount.toString()}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    itemCount++;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.black,
                                  )),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),

                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          width: 160.w,
                          child: ElevatedButton(onPressed: (){},
                            child: Text('Buy Now',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                            style:   ElevatedButton.styleFrom(
                                backgroundColor: AppColors.grey5,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          width: 160.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color:  AppColors.orange,
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                  onPressed: (){

                                  },
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                      color:  AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  )
                              ),

                              SvgPicture.asset(AssetsPaths.MyCartWhite),



                            ],


                          )
                        ),

                      ],
                    )


                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
