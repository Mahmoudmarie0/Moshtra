import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';

class Sub_Cat {
  String? id,name,image;
  List<ProductModel> product = [];

  Sub_Cat(this.id,this.name,this.image,this.product);

  Sub_Cat.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :id = snapshot.id,
      name = snapshot['name'],
      image = snapshot['image'],
      product = [];

}