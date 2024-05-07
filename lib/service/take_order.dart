import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/User_model.dart';

import '../models/products_model.dart';
import '../screens/Payment/myCartPayment/controller/controller.dart';
import '../screens/auth/register/controller/controller.dart';

class take_order {

  User_Model user;
  List<ProductModel> products;
  dynamic totalPrice;
  take_order({required this.products,required this.user,required this.totalPrice})
  {
    AddOrder();
  }


  CollectionReference orders = FirebaseFirestore.instance.collection('oreders');

  AddOrder()
  {
    orders.add({
      'user': user.toJson(),
      'products': products.toList(),
      'orederDate': DateTime.now(),
      'totalPrice': totalPrice,
      'status': ''
    });

  }


}