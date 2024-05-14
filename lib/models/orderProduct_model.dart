
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/utils/custom_widgets/global_widgets/products_ListView.dart';

class orderProduct{
    String id, Quantity;
    ProductModel productModel;


  // orders(this.orderDate,this.totalPrice, this.status);


  orderProduct.fromSnapshot(snapshot)
  :id = snapshot.id,
    Quantity = snapshot['quantity'],
    productModel = ProductModel.fromSnapshot(snapshot['product']);





}



