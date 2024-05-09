import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';
import 'package:moshtra/screens/Payment/myCartPayment/view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';
import '../../models/cart_model.dart';
import '../../models/newCart_model.dart';
import '../../models/products_model.dart';
import '../../service/stripe_payment/payment_manager.dart';
import '../../utils/constants/assets.dart';
import '../../utils/custom_widgets/global_widgets/empty_screen.dart';
import '../Details/view.dart';
import '../Home_layout/controller.dart';


class MyCartScreen extends StatefulWidget {
  //MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  HomeLayoutController homeLayoutController=Get.put(HomeLayoutController(),permanent: true);
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');
  dynamic totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return cartListScreen();
  }

  Widget cartListScreen() {
    return StreamBuilder<QuerySnapshot>(
        stream: cart.orderBy('createdAt').snapshots(),
        builder: (context , snapshot) {
          List<new_cart> cartList = [];
          List<ProductModel> products = [];
          if(!snapshot.hasData)
            return CircularProgressIndicator();
          else {
            totalPrice = 0;

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              if (snapshot.data!.docs[i].get('userId') ==
                  FirebaseAuth.instance.currentUser!.uid) {
                cartList.add(new_cart.fromSnapshot(snapshot.data!.docs[i]));
                products.add(ProductModel.fromJson(snapshot.data!.docs[i]['product']));
                totalPrice += int.parse(snapshot.data!.docs[i]['product']['price']) *
                    int.parse(snapshot.data!.docs[i].get('quantity'));

              }
            }
          }

          if(cartList.length == 0)
            return   buildEmptyScreen(titleText: 'Your Cart is empty'.tr ,subTitleText:  'Looks like you have not added anything in your \ncart. Go ahead and explore top categories.' .tr,btnText:  'Explore Categories'.tr ,homeLayoutController:  homeLayoutController);
          else
            return Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                            if (snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid){
                              cart.doc(snapshot.data!.docs[i].id).delete();
                            }
                          }

                        },
                        child: Text(
                          'Clear',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                            )
                        ),
                      ),
                    ),
                  ),
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
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(DetailsScreen(cartList[index]!.product!));
                                    },
                                    child: Container(
                                        width: 120.w,
                                        height: 120.h,
                                        child: Image.network(
                                          cartList[index].product!.image!,
                                        )
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10, top: 8),
                                            width: 165,
                                            child: Text(
                                              Get.locale?.languageCode == "en"?
                                              cartList[index].product!.nameEN! : cartList[index].product!.nameAR!,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child:
                                          Text(
                                            '${cartList[index].product!.price} EGP',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 96.w,
                                          height: 24.h,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        for(int i = 0 ; i < snapshot.data!.docs.length ; i++) {
                                                          if (snapshot.data!.docs[i].get('userId') ==
                                                              FirebaseAuth.instance.currentUser!.uid &&
                                                              snapshot.data!.docs[i]['product']['productId'] ==
                                                                  cartList[index].product!.productId) {
                                                            if (int.parse(cartList[index].quantity!) > 1 ) {
                                                              cart.doc(snapshot.data!.docs[i].id).update(
                                                                  {'quantity': (int.parse(cartList[index].quantity!) - 1).toString()});

                                                              totalPrice -= double.parse(
                                                                  cartList[index].product!.price!);
                                                            }
                                                          }
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(Icons.remove))),
                                                Spacer(),
                                              Expanded(
                                                  child: Text(
                                                    '${int.parse(
                                                        cartList[index].quantity!)}',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              Expanded(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        for(int i = 0 ; i < snapshot.data!.docs.length ; i++) {
                                                          if (snapshot.data!.docs[i].get('userId') ==
                                                              FirebaseAuth.instance.currentUser!.uid &&
                                                              snapshot.data!.docs[i]['product']['productId'] ==
                                                                  cartList[index].product!.productId) {
                                                            cart.doc(snapshot.data!.docs[i].id).update(
                                                                {'quantity': (int.parse(cartList[index].quantity!) + 1).toString()});

                                                            totalPrice += double.parse(
                                                                cartList[index].product!.price!);
                                                          }
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(Icons.add)))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          GestureDetector(
                                            onTap: () async {
                                              for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                                                if (snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid &&
                                                    snapshot.data!.docs[i]['product']['productId'] == cartList[index].product!.productId){
                                                  cart.doc(snapshot.data!.docs[i].id).delete();
                                                }
                                              }

                                              setState(() {});
                                            },
                                            child: SvgPicture.asset(
                                                AssetsPaths.Trash
                                            ),
                                          )

                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: cartList.length,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
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
                              text: 'TOTAL'.tr,
                              fontSize: 18,
                              color: Colors.grey,
                              fontweight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: '${totalPrice}  EGP',
                              fontSize: 22,
                              color: Colors.black,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(()=>MyCart(products),arguments: totalPrice );



                          },
                          child: Text(
                            'Checkout(${cartList.length})'.tr,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              minimumSize: Size(150, 50),
                              backgroundColor: Color(0xfff88160),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );

        }
    );
  }

}