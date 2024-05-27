import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/orders_model.dart';
import 'package:moshtra/models/orderProduct_model.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import 'controller/Controller.dart';

class OrderScreen extends StatelessWidget {
  // const OrderScreen({Key? key}) : super(key: key);

  orderController controller = Get.put(orderController());


  CollectionReference order = FirebaseFirestore.instance.collection('Users').doc('PpSZavBW43YINs1F6qTf')
                              .collection('orders');

  @override
  Widget build(BuildContext context) {
    controller.getOrder();
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: order.orderBy('orderDate').snapshots(),
        builder: (context, snapshot){
          List<orders> myorders = [];
          List<String> dates = [];
          if (!snapshot.hasData)
            return CircularProgressIndicator();
          else {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              myorders.add(orders.fromSnapshot(snapshot.data!.docs[i]));
              DateTime dateTime = snapshot.data!.docs[i]['orderDate'].toDate();
              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
              dates.add(formattedDate);
            }
          }
          if (myorders.length == 0)
            return Container();
          else
             {
              return ListView.builder(
                itemCount: myorders.length,
                itemBuilder: (context,index){
                  return Padding(padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order ID: "adham"',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("3/7/2002"),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        ExpansionTile(
                          title: Text(
                            'Items',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children:<Widget>[
                        Container(
                        height: 300.h,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount:3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index)
                                  {
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
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: AppColors.white,
                                                ),
                                                height: 200.h,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("adham"),

                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(height: 1.h,),
                                          Text("data"),
                                          SizedBox(height: 5.h,),
                                          Text("subdescription"),
                                          SizedBox(height: 5.h,),
                                          Text("25")

                                        ],
                                      ),
                                    );
                                  }, separatorBuilder: (context, index) { return SizedBox(width: 20.w,);},),
                              ),
                            ],
                          ),
                        )


                          ],
                        ),// Add more OrderCard widgets...
                      ],
                    ),
                  );
                },

              );
            }

        },
      )
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final List<OrderItem> items;
  final String total;
  final String status;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.orderDate,
    required this.items,
    required this.total,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigate to order details screen
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: $orderId',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(orderDate),
                ],
              ),
              SizedBox(height: 8.0),
              ExpansionTile(
                title: Text(
                  'Items',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: items.map((item) {
                  return ListTile(
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.brand),
                        Text(
                          'Size: ${item.size} - Color: ${item.color}',
                        ),
                      ],
                    ),
                    trailing: Text(
                      item.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: $total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.hourglass_empty,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        'On Process ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),

            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem {
  final String title;
  final String price;
  final String brand;
  final String size;
  final String color;
  final String imageUrl;

  OrderItem({
    required this.title,
    required this.price,
    required this.brand,
    required this.size,
    required this.color,
    required this.imageUrl,
  });
}