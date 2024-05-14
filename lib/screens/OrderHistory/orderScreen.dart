import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/orders_model.dart';
import 'package:moshtra/models/orderProduct_model.dart';

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
                        OrderCard(
                          orderId: myorders[index].orderId.toString().substring(0,10),
                          orderDate: dates[index],
                          items: [
                            OrderItem(
                              title: 'sadasd',
                              price: '',
                              brand: 'Zara Brand',
                              size: myorders[index].orderProducts[0].productModel.Sized.toString(),
                              color: myorders[index].orderProducts[0].productModel.color.toString(),
                              imageUrl: myorders[index].orderProducts[0].productModel.image.toString(), // Replace with your image URL
                            ),
                            // Add more items...
                          ],
                          total: myorders[index].totalPrice.toString(),
                          status: myorders[index].status.toString(),
                        ),
                        // Add more OrderCard widgets...
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
              Stepper(
                type: StepperType.vertical, // Adjust type as needed
                currentStep: 0, // Set the current step
                steps: [
                  Step(
                    title: Text('Step 1'),
                    content: Text('Content for Step 1'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: Text('Content for Step 2'),
                    isActive: false,
                  ),
                  Step(
                    title: Text('Step 3'),
                    content: Text('Content for Step 3'),
                    isActive: false,
                  ),
                ],
              ),
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