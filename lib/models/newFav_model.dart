import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';

class new_fav{

  ProductModel? product;
  String? userId;
  new_fav(this.product);

  new_fav.fromSnapshot(snapshot)
      :product = ProductModel.fromSnapshot(snapshot['product']),
        userId = snapshot['userId'];



}