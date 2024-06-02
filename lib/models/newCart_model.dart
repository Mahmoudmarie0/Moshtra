import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';

class new_cart{

  ProductModel? product;
  String? quantity, userId;

  new_cart(this.product, this.quantity,this.userId);

  new_cart.fromSnapshot(snapshot)
      :product = ProductModel.fromSnapshot(snapshot['product']),
        quantity = snapshot['quantity'],
        userId = snapshot['userId'];



}