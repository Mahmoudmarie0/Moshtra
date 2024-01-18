import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/cart_product_model.dart';
import 'package:moshtra/screens/checkout/OrderSuccess.dart';
import 'package:moshtra/screens/checkout/Payment_method_screen.dart';
import 'package:moshtra/screens/checkout/shipping_adress_screen.dart';
import 'package:moshtra/utils/constants/colors.dart';


import '../MyCart/database/cart_view_model.dart';
class OrderConfirmScreen extends StatelessWidget {
  //const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text("Shipping Address",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  height:130 ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dear Proggrammer",
                              style: TextStyle(
                                  fontSize: 16
                              ),),
                            TextButton(
                              onPressed: () {
                                Get.to(ShippingAdress());
                              },
                              child:Text("Change",
                                style: TextStyle(fontSize: 18,
                                  color: Color(0xFFDB3022),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text("mohamed hossam,01158814259,3 Newbdidge court",
                          style: TextStyle(
                              fontSize: 16),
                        ),
                        Text("Chino Hills, CA,97545,United State",
                          style: TextStyle(
                              fontSize: 16
                          ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment Method",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(PaymentMethodScreen());
                      },
                      child:Text("Change",
                        style: TextStyle(fontSize: 18,
                          color: Color(0xFFDB3022),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Image.asset("assets/images/amazon-pay.png"),
                    ),
                    SizedBox(width: 10),
                    Text("*** *** *** 3947"),
                  ],
                ),
                SizedBox(height: 30),
                Text("Delivery Method",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/Talabat.png",height: 60,),
                      Text("2-7 Days"),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$300",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Shipping Free",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$15.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Divider(height: 30
                  ,color: Colors.black,
                ),

                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$580",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),

                GetBuilder<CartViewModel>(
                  builder:(controller) => ElevatedButton(
                    onPressed: (){
                      Get.to(OredrSuccessScreen());
                    },

                    child: Text('Confirm Order' ,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        minimumSize: Size(150, 50),
                        backgroundColor: Color(0xfff88160),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}













//
// import 'package:flutter/material.dart';
// class AddAddress extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[
//           Container(
//             child: Text(
//               "Add your Address",
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }