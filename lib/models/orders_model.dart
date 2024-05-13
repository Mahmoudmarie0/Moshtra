
import 'package:cloud_firestore/cloud_firestore.dart';

class orders{

  String? orderId, paymentMethod, orderPhone, orderAddress, totalPrice, status;

  Timestamp? orderDate, DelivryDate;

  // orders(this.orderDate,this.totalPrice, this.status);


  orders.fromSnapshot(QueryDocumentSnapshot <Map<String,dynamic>> snapshot)
      :orderId = snapshot.id,
        totalPrice = snapshot['totalPrice'],
        status = snapshot['status'],
        orderDate = snapshot['orderDate'],
        DelivryDate = snapshot['DelivryDate'],
        paymentMethod = snapshot['paymentMethod'],
        orderPhone = snapshot['orderPhone'],
        orderAddress = snapshot['orderAddress'];




}



