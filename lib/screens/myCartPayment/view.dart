
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:moshtra/utils/constants/colors.dart';


import '../../utils/custom_widgets/build_appbar.dart';
import '../../utils/custom_widgets/global_widgets/app_button.dart';

import '../../utils/custom_widgets/cart_info.dart';
import '../../utils/custom_widgets/custom_button.dart';
import '../../utils/custom_widgets/total_price.dart';
import '../payment_details/view.dart';


class MyCart extends StatelessWidget {
  const MyCart({key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                    children: [
            SizedBox(height:5 ,),
            Expanded(child: Image.asset('assets/images/basket.png')),
            SizedBox(height:20 ,),
                      OrderInfoItem(
              title: 'Order Subtotal',
              value: r'$42.97',


            ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Discount',
                        value: r'$0',


                      ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Shipping',
                        value: r'$8',


                      ),
                      SizedBox(height:17 ,),
                      Divider(
                        thickness: 2,
                        height: 34,
                        color: Color(0xFFC6C6C6),
                      ),
                      Total_price(
                        price: r'$50.97',

                      ),
                      SizedBox(height:16 ,),
            // CustomButton(
            //   onTap: (){
            //     Get.to(PaymentDetails());
            //   }, txt: 'Complete Payment',
            // ),
                      buttonWidget(
                        text: 'Complete Payment',
                        width: 350,
                        height: 73,
                        radius: 15,
                        onPress: () {
                          Get.to(PaymentDetails());
                        },
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: AppColors.white,
                        conColor: AppColors.orange,


                      ),
                      SizedBox(height:60 ,),




                  ],



                ),
          ),
    );
  }


}









