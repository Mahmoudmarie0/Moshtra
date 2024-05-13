import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moshtra/screens/Payment/widgets/payment_method_list_view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../../models/newCart_model.dart';
import '../../../models/products_model.dart';
import '../../../service/paypal_payment/paypal_management.dart';
import '../../../service/stripe_payment/payment_manager.dart';
import '../../../utils/custom_widgets/global_widgets/app_button.dart';
import '../controller/controller.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  @override
  // final int sum = Get.arguments ;

  final dynamic total;
  final dynamic shipping;
  final dynamic subtotal;
  final dynamic phone;
  final dynamic address;
  List<ProductModel> products;
  List<new_cart> cartList;

  //final dynamic data;

  PaymentMethodsBottomSheet(
      {required this.total, required this.shipping, required this.subtotal, required this.products, required this.cartList, required this.phone, required this.address});

  Widget build(BuildContext context) {

    return GetBuilder<PaymentController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              PaymentMethodsListView(),
              const SizedBox(
                height: 30,
              ),
              buttonWidget(
                onPress: () async {



                  controller.activeIndex == 0
                      ? PaymentManager.makePayment(total, "EGP",products,cartList,phone,address)
                      : Get.to(
                          PaypalManager.buildPaypalCheckout(context, products, total, shipping, subtotal,cartList,phone,address),
                        );
                  ;
                },
                text: 'Continue',
                width: double.infinity,
                height: 73,
                radius: 15,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.white,
                conColor: AppColors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
