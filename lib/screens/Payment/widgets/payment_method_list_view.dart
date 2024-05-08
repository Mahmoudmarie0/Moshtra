import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Payment/widgets/payment_method_item.dart';

import '../controller/controller.dart';




class PaymentMethodsListView extends StatefulWidget {
  PaymentMethodsListView();

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String>PaymentMethodsItems=const[
    "assets/images/credit.svg",
    "assets/images/paypal.svg",
  ];
//int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(

      builder: (controller)=> SizedBox(
        height:62 ,
        // width: 103,
        child: ListView.builder(
            itemCount: PaymentMethodsItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Padding(

                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: (){
                    controller. activeIndex=index;
                    setState(() {
                    });
                  },
                  child: PaymentMethoditem(
                    isActive: controller.activeIndex==index,
                    img: PaymentMethodsItems[index],),
                ),
              );
            }
        ),
      ),
    );
  }
}