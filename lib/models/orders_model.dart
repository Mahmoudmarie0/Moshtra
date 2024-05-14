
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/utils/custom_widgets/global_widgets/products_ListView.dart';

import 'orderProduct_model.dart';

class orders{

  String? orderId, paymentMethod, orderPhone, orderAddress, totalPrice, status;

  Timestamp? orderDate, DelivryDate;
  List<orderProduct> orderProducts = [];

  // orders(this.orderDate,this.totalPrice, this.status);


  orders.fromSnapshot(snapshot)
      :orderId = snapshot.id,
        totalPrice = snapshot['totalPrice'],
        status = snapshot['status'],
        orderDate = snapshot['orderDate'],
        DelivryDate = snapshot['DelivryDate'],
        paymentMethod = snapshot['paymentMethod'],
        orderPhone = snapshot['orderPhone'],
        orderAddress = snapshot['orderAddress'],
        orderProducts = [];




}



