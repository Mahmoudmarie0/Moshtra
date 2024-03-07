import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_widgets/build_appbar.dart';
import '../../utils/custom_widgets/global_widgets/app_button.dart';

import '../../utils/custom_widgets/custom_button.dart';
import '../../utils/custom_widgets/custom_credit_card.dart';
import '../../utils/custom_widgets/payment_method_list_view.dart';



class PaymentDetails extends StatefulWidget {
   PaymentDetails({key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  buildAppBar(title: 'Payment Details'),
      body: Column(
        children: [
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 30),
            child: PaymentMethodsListView(),
          ),
          SizedBox(height: 34,),
          CustomCreditCard(formKey: formKey, autovalidateMode: autovalidateMode,),
          SizedBox(height: 35,),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            // child:
            // CustomButton(
            //   onTap: (){
            //     if(formKey.currentState!.validate()){
            //       formKey.currentState!.save();
            //     }else{
            //       autovalidateMode=AutovalidateMode.always;
            //       setState(() {
            //
            //       });
            //
            //     }
            //     Get.to(PaymentDetails());
            //     print('test');
            //   }, txt: 'Pay',
            // ),
            child: buttonWidget(
              text: 'Pay',
              width: 350,
              height: 73,
              radius: 15,
              onPress: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autovalidateMode=AutovalidateMode.always;
                  setState(() {

                  });

                }
                Get.to(PaymentDetails());
                print('test');
                Get.to(PaymentDetails());
              },
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: AppColors.white,
              conColor: AppColors.orange,


            ),
          ),


        ],
      ),
    );
  }
}









