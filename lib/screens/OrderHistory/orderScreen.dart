import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:moshtra/models/orders_model.dart';
import 'package:moshtra/models/orderProduct_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import 'controller/Controller.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // const OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return GetBuilder<orderController>(
      init: orderController(),
        builder: (controller) {
          if(controller.loading.value)
          {

            return Center(child: CircularProgressIndicator());
          }
          else
            {

              CollectionReference order = FirebaseFirestore.instance.collection('Users').doc(controller.userRef!.id)
                  .collection('orders');
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Order List'.tr),
                  ),
                  body: StreamBuilder<QuerySnapshot>(
                    stream: order.orderBy('orderDate',descending: true).snapshots(),
                    builder: (context, snapshot){
                      List<orders> myorders = [];
                      List<String> dates = [];
                      List<String> times = [];
                      List<String> delveryDates =[];
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      else {
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          myorders.add(orders.fromSnapshot(snapshot.data!.docs[i]));
                          DateTime dateTime = snapshot.data!.docs[i]['orderDate'].toDate();
                          DateTime delDate = snapshot.data!.docs[i]['DelivryDate'].toDate();

                          String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                          String formattedDelDate = "${delDate.day}/${delDate.month}/${delDate.year}";
                          String formattedTime = DateFormat('hh:mm a').format(dateTime);
                          times.add(formattedTime);
                          dates.add(formattedDate);
                          delveryDates.add(formattedDelDate);
                        }
                      }
                      if (myorders.length == 0)
                        return Container();
                      else
                      {
                        return SmartRefresher(
                          onRefresh: ()async{
                            await controller.updateOrderStatus();
                            controller.refreshController.refreshCompleted();
                          },


                          enablePullUp: true,
                          controller: controller.refreshController,
                          scrollController: controller.scrollController,
                          child: ListView.builder(
                            itemCount: myorders.length,
                            itemBuilder: (context,index){
                              return Padding(padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Order ID: ${myorders[index].orderId?.substring(0,10)}'.tr,
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text('${dates[index]}  ${times[index]}'),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            ExpansionTile(
                                              title: Text(
                                                'Items'.tr,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              children:[
                                                Container(
                                                  height: 300.h,
                                                  padding: EdgeInsets.only(left: 10,right: 10),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: StreamBuilder<QuerySnapshot>(
                                                            stream: order.doc(myorders[index].orderId).collection('products').snapshots(),
                                                            builder: (context, productsSnapshot){
                                                              if(!productsSnapshot.hasData)
                                                              {
                                                                return Center(child: CircularProgressIndicator());
                                                              }
                                                              else
                                                              {
                                                                myorders[index].orderProducts.clear();
                                                                for(int j=0; j < productsSnapshot.data!.docs.length; j++)
                                                                {
                                                                  myorders[index].orderProducts.add(orderProduct.fromSnapshot(productsSnapshot.data!.docs[j]));
                                                                }
                                                              }
                                                              if(myorders[index].orderProducts.isEmpty)
                                                              {
                                                                return Container();
                                                              }
                                                              else {
                                                                return ListView.separated(
                                                                  padding: EdgeInsets.zero,
                                                                  itemCount: myorders[index].orderProducts.length,
                                                                  scrollDirection: Axis
                                                                      .horizontal,
                                                                  itemBuilder: (context,
                                                                      productIndex) {
                                                                    return Container(
                                                                      width: 150.w,
                                                                      child: Column(
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                            child: GestureDetector(
                                                                              // onTap:(){
                                                                              //   String currentRoute = ModalRoute.of(context)!.settings.name ?? '';
                                                                              //   if(currentRoute == '/DetailsScreen'){
                                                                              //     homeController.addHistory(products[index]);
                                                                              //     model = products[index];
                                                                              //   }
                                                                              //   else {
                                                                              //     homeController.addHistory(products[index]);
                                                                              //     Get.to(DetailsScreen(products[index]));
                                                                              //   }
                                                                              //
                                                                              // },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius
                                                                                      .circular(
                                                                                      12),
                                                                                  color: AppColors
                                                                                      .white,
                                                                                ),
                                                                                height: 200.h,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .all(
                                                                                      8.0),
                                                                                  child: Image.network(myorders[index].orderProducts[productIndex].productModel.image as String),

                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                          SizedBox(height: 1.h,),
                                                                          Text(myorders[index].orderProducts[productIndex].productModel.nameEN.toString()),
                                                                          SizedBox(height: 5.h,),
                                                                          CustomText(text:Get.locale?.languageCode == "en"? myorders[index].orderProducts[productIndex].productModel.sub_descriptionEN as String : myorders[index].orderProducts[productIndex].productModel.sub_descriptionAR as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                                                                          SizedBox(
                                                                            height: 5.h,),
                                                                          Text('X${myorders[index].orderProducts[productIndex].Quantity}')

                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                  separatorBuilder: (context,
                                                                      index) {
                                                                    return SizedBox(width: 20
                                                                        .w,);
                                                                  },
                                                                );

                                                              }
                                                            }
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )


                                              ],
                                            ),
                                            ExpansionTile(
                                              title: Text(
                                                'order details'.tr,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Address: '.tr,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Expanded(
                                                        child: SingleChildScrollView(
                                                            scrollDirection: Axis.horizontal,
                                                            child: CustomText(
                                                              text: myorders[index].orderAddress.toString(),
                                                              fontweight: FontWeight.w400,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Phone: '.tr,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      CustomText(
                                                        text: "0${myorders[index].orderPhone.toString()}",
                                                        fontweight: FontWeight.w400,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Payment Method: '.tr,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      CustomText(
                                                        text: myorders[index].paymentMethod.toString(),
                                                        fontweight: FontWeight.w400,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Delivery Date: '.tr,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      CustomText(
                                                        text: delveryDates[index],
                                                        fontweight: FontWeight.w400,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Status: '.tr,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      CustomText(
                                                        text: myorders[index].status.toString(),
                                                        fontweight: FontWeight.w400,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        text: 'Total'.tr+': ',
                                                        fontSize: 16,
                                                        fontweight: FontWeight.bold,
                                                      ),
                                                      CustomText(
                                                        text: myorders[index].totalPrice.toString(),
                                                        fontweight: FontWeight.w400,
                                                      ),
                                                    ],
                                                  ),

                                                  myorders[index].status == 'Picked'? Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          await controller.updateOrderStatus();
                                                          setState(() {

                                                          });
                                                          if(myorders[index].status == 'Picked'){
                                                            final  productsQuerey = await order.doc(snapshot.data!.docs[index].id).collection('products').get();
                                                            for(int i=0;i<productsQuerey.docs.length; i++) {
                                                              DocumentReference d =
                                                              order.doc(snapshot.data!.docs[index].id).collection('products').doc(productsQuerey.docs[i].id);
                                                              d.delete();
                                                            }

                                                            order.doc(snapshot.data!.docs[index].id).delete();
                                                          }
                                                          else{

                                                          }
                                                        },
                                                        child: Text(
                                                          'cancel'.tr,
                                                          style: TextStyle(
                                                            color: AppColors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                            splashFactory: NoSplash.splashFactory,
                                                            minimumSize: Size(80, 50),
                                                            backgroundColor: Colors.red,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.all(Radius.circular(10)),
                                                            )),
                                                      ),
                                                    ),
                                                  ) :
                                                  Container(),

                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },

                          ),
                        );
                      }

                    },
                  )
              );
            }
        }

    );
  }
}