import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:lottie/lottie.dart';
import 'package:moshtra/screens/MyCart/database/cart_view_model.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

import '../../utils/constants/assets.dart';

import '../../utils/constants/components.dart';
import '../Home_layout/controller.dart';
import '../checkout/checkout_view.dart';

class MyCartScreen extends StatefulWidget {
   MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  HomeLayoutController homeLayoutController=Get.put(HomeLayoutController(),permanent: true);

  @override
  Widget build(BuildContext context) {

    return cartListScreen();

  }

  Widget buildEmptyCartList() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.CartListEmpty),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Your Cart is empty',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Looks like you have not added anything in your \ncart. Go ahead and explore top categories.',

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff6F7384),
                    height: 1.55,
                  ),
                ),
              ),
              ElevatedButton(

                  onPressed: () {
                    homeLayoutController.SeeAll();

                    // Get.to(CategoriesScreen(),transition: Transition.upToDown);
                    // Go To Categories
                  },
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      minimumSize: Size(328, 60),
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      )
                  ),
                  child: Text(

                    'Explore Categories',
                    style: TextStyle(
                      color: HexColor('#FFFFFF'),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
              ),
            ]
        ),
      ),
    );
  }

  Widget cartListScreen() {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => controller.cartProductModel.length == 0 ? buildEmptyCartList() :
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 328.w,
                          height: 120.h,
                          child: Row(
                            children: [
                              Container(
                                  width: 120.w,
                                  height: 120.h,
                                  child: Image.network(
                                    controller.cartProductModel[index].image!,
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 10 , right: 10 , top: 8),
                                      width: 165,
                                      child: Text(
                                        controller.cartProductModel[index].name!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(left: 10 , right: 10),
                                    child:
                                    Text(
                                      '${controller.cartProductModel[index].price!.toString()} EGP' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 96.w,
                                    height: 32.h,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: IconButton(
                                                onPressed: () {
                                                  controller.decreaseQuantity(index);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.remove))),
                                        Spacer(),
                                        Expanded(
                                            child: Text(
                                              controller.cartProductModel[index].quantity.toString(),
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                            child: IconButton(
                                                onPressed: () {
                                                  controller.increaseQuantity(index);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.add)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Checkbox(value: true, onChanged: (bool? value) {}),
                                      SvgPicture.asset(
                                          AssetsPaths.Trash
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.cartProductModel.length,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25 , right: 25),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      fontSize: 18,
                      color: Colors.grey,
                      fontweight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.put(CartViewModel()),
                      builder: (controller) => CustomText(
                        text: '${controller.totalPrice}  EGP',
                        fontSize: 22,
                        color: Colors.black,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  builder:(controller) => ElevatedButton(
                      onPressed: (){
                        Get.to(CheckOutView());
                      },
                      child: Text('Checkout(${controller.cartProductModel.length})' ,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          fontSize: 18,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}





