import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshtra/screens/Details/Components/bullet.dart';
import 'package:moshtra/screens/Details/Components/bulletTabs.dart';
import 'package:moshtra/screens/Details/Components/colors.dart';
import 'package:moshtra/utils/constants/assets.dart';

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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent
                ),
                height: 290.h,
                width: double.infinity,
                child: Image.asset(
                  AssetsPaths.Watch,
                  fit: BoxFit.contain,
                  width: 120,
                  height: 120,
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
                margin: EdgeInsets.only(top: 44, left: 16),
                child: IconButton(
                  iconSize: 32,
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){},),
              ),

              Container(
                margin: EdgeInsets.only(top: 250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 482.h,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Expanded(
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
                                  color: Color(0xff08e488),
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

                        Text('Color',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                        Row(
                          children: [
                            ColorWidget(),
                            ColorWidget(),
                            ColorWidget(),
                            ColorWidget(),
                            ColorWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Quantity',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),

                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0,
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                                      color: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        itemCount++;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.grey,
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
                              child: Expanded(
                                child: ElevatedButton(onPressed: (){},
                                  child: Text('But Now',style: TextStyle(color: Colors.black),),
                                  style:   ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 1
                                        ),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              height: 60.h,
                              child: Expanded(
                                child: ElevatedButton(onPressed: (){},
                                    child: Text('Add To Cart'),style:   ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xfff88160),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    )
                                  ),
                                  ),),
                              ),

                          ],
                        )


                      ],
                    ),
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}
