import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/screens/Payment/myCartPayment/view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';
import '../../models/cart_model.dart';
import '../../utils/constants/assets.dart';
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
                      color: AppColors.white,
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
    return StreamBuilder<QuerySnapshot>(
        stream: cart.orderBy('createdAt').snapshots(),
        builder: (context , snapshot) {
          List<Cart> cartList = [];
          totalPrice = 0;

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if( snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid ) {

              cartList.add(Cart.fromJson(snapshot.data!.docs[i]));

              totalPrice += int.parse(snapshot.data!.docs[i].get('price')) *
                  int.parse(snapshot.data!.docs[i].get('quantity'));
            }
          }

          if(cartList.length == 0)
            return buildEmptyCartList();
          else
            return Column(
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
                                GestureDetector(
                                  onTap: () {
                                    //Get.to(DetailsScreen(ProductModel()));
                                    //Get.to(DetailsScreen(cartList[index] as ProductModel));
                                  },
                                  child: Container(
                                      width: 120.w,
                                      height: 120.h,
                                      child: Image.network(
                                        cartList[index].image,
                                      )
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 8),
                                        width: 165,
                                        child: Text(
                                          cartList[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10),
                                      child:
                                      Text(
                                        '${cartList[index].price} EGP',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Container(
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
                                                          snapshot.data!.docs[i].get('productId') ==
                                                              cartList[index].productId) {
                                                        if (int.parse(cartList[index].quantity) > 1 ) {
                                                          cart.doc(snapshot.data!.docs[i].id).update(
                                                              {'quantity': (int.parse(cartList[index].quantity) - 1).toString()});

                                                          totalPrice -= double.parse(
                                                              cartList[index].price);
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
                                                    cartList[index].quantity)}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              )),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    for(int i = 0 ; i < snapshot.data!.docs.length ; i++) {
                                                      if (snapshot.data!.docs[i].get('userId') ==
                                                          FirebaseAuth.instance.currentUser!.uid &&
                                                          snapshot.data!.docs[i].get('productId') ==
                                                              cartList[index].productId) {
                                                        cart.doc(snapshot.data!.docs[i].id).update(
                                                            {'quantity': (int.parse(cartList[index].quantity) + 1).toString()});

                                                        totalPrice += double.parse(
                                                            cartList[index].price);
                                                      }
                                                    }
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

                                        GestureDetector(
                                          onTap: () async {
                                            for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                                              if (snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid &&
                                                  snapshot.data!.docs[i].get('productId') == cartList[index].productId){
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
                            text: 'TOTAL',
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
                          Get.to(()=>MyCart(),arguments: [totalPrice , cartList.toList()] );

                        },
                        child: Text(
                          'Checkout(${cartList.length})',
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
            );

        }
    );
  }
}