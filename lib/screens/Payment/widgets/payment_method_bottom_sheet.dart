
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/screens/Payment/widgets/payment_method_list_view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../../service/stripe_payment/payment_manager.dart';
import '../../../utils/custom_widgets/global_widgets/app_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  @override
  final int sum=Get.arguments+8;
  Widget build(BuildContext context) {

    return Container(

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
              onPress: () {
                PaymentManager.makePayment(sum,"USD");


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
    );
  }
}