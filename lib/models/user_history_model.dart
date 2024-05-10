import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';

class user_history{

  ProductModel? product;
  String? userId;
  user_history(this.product);

  user_history.fromSnapshot(snapshot)
      :product = ProductModel.fromSnapshot(snapshot['product']),
        userId = snapshot['userId'];



}