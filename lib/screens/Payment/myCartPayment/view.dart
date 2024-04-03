
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../../utils/custom_widgets/build_appbar.dart';
import '../widgets/cart_info.dart';
import '../../../utils/custom_widgets/global_widgets/app_button.dart';
import '../widgets/payment_method_bottom_sheet.dart';
import '../widgets/total_price.dart';

class MyCart extends StatelessWidget {
   MyCart({key});
   dynamic  total=Get.arguments;
   final double sum=Get.arguments+8;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(title: 'My Cart',SearchDisplay:false),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                    children: [
            SizedBox(height:5 ,),
            Expanded(child: Image.asset('assets/images/basket.png')),
            SizedBox(height:20 ,),
                      OrderInfoItem(
              title: 'Order Subtotal',
              value: '$total EGP',
            ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Discount',
                        value: r'0 EGP',
                      ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Shipping',
                        value: r'8 EGP',
                      ),
                      SizedBox(height:17 ,),
                      Divider(
                        thickness: 2,
                        height: 34,
                        color: Color(0xFFC6C6C6),
                      ),
                      Total_price(

                        price: '$sum EGP',

                      ),
                      SizedBox(height:16 ,),
                      buttonWidget(
                        text: 'Complete Payment',
                        width: 350,
                        height: 73,
                        radius: 15,
                        onPress: () {
                         Get.bottomSheet(

                                  PaymentMethodsBottomSheet(),
                           settings: RouteSettings(arguments:sum),

                              );
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









