import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/products_model.dart';


class Cat_Model {
  String? id,nameAR,nameEN,image;
  List<ProductModel> product = [];

  Cat_Model(this.id,this.nameAR,this.nameEN,this.image,this.product);
  Cat_Model.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :id = snapshot.id,
        nameAR = snapshot['nameAR'],
        nameEN = snapshot['nameEN'],
       image = snapshot['image'],
       product=[];

}