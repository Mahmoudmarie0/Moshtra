import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Payment/thankyou/view.dart';

import 'package:moshtra/screens/Payment/widgets/payment_method_list_view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:paymob_payment/paymob_payment.dart';
import '../../../models/newCart_model.dart';
import '../../../models/products_model.dart';
import '../../../service/paypal_payment/paypal_management.dart';
import '../../../service/stripe_payment/payment_manager.dart';
import '../../../utils/constants/components.dart';
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
  PaymobResponse? response;




  //final dynamic data;

  PaymentMethodsBottomSheet(
      {required this.total,
      required this.shipping,
      required this.subtotal,
      required this.products,
      required this.cartList,
      required this.phone,
      required this.address});

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
                  if (controller.activeIndex == 0) {
                    PaymentManager.makePayment(
                        total, "EGP", products, cartList, phone, address);
                  }

                  if (controller.activeIndex == 1) {
                    Get.to(PaypalManager.buildPaypalCheckout(context, products,
                        total, shipping, subtotal, cartList, phone, address));
                  }

                  if (controller.activeIndex == 2) {
                    PaymobPayment.instance.pay(
                        context: context,
                        currency: "EGP",
                        amountInCents: total.toString()+"00",
                        onPayment: (response)async {
                          print(response);
                          if (response.success == true) {


                           //await Get.to(()=> ThankYouView( total: total,));
                            GetSnackbarError(
                              message: 'The payment was completed successfully'.tr,
                              Color: AppColors.Green,
                            );
                            print(response.success);
                            products;
                            cartList;
                            phone;
                            address;
                            total;
                          }
                        }
                        // onPayment: (response) => setState(() => this.response = response),
                        );
                  }

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
