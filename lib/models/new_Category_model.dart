import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';


class Cat_Model {
  String? id,name,image;
  List<ProductModel> product = [];

  Cat_Model(this.id,this.name,this.image,this.product);
  Cat_Model.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :id = snapshot.id,
       name = snapshot['name'],
       image = snapshot['image'],
       product=[];

}