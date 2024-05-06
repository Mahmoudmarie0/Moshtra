

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class ProductModel{
  String ?name,image ,descriptionAR,descriptionEN,Sized,price,sub_description,productId,type;
  Color? color;

  ProductModel({
      this.name,
      this.image,
      this.descriptionAR,
      this.descriptionEN,
      this.color,
      this.Sized,
      this.price,
      this.sub_description,
      this.productId,
      this.type
  });


  ProductModel.fromJson(Map<dynamic,dynamic>map){
    name=map['name'];
    image=map['image'];
    descriptionEN=map['descriptionEN'];
    descriptionAR=map['descriptionAR'];
    color= HexColor.fromHex(map['color']);
    Sized=map['Sized'];
    price=map['price'];
    sub_description=map['sub_description'];
    productId=map['productId'];
    type=map['type'];
  }
  ProductModel.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :productId = snapshot.id,
        name = snapshot['name'],
        image = snapshot['image'],
        descriptionEN = snapshot['descriptionEN'],
        descriptionAR = snapshot['descriptionAR'],
        Sized = snapshot['Sized'],
        price = snapshot['price'],
        type = snapshot['type'],
        sub_description = snapshot['sub_description'],
        color = HexColor.fromHex(snapshot['color']);


  toJson(){
    return{
      'name':name,
      'image':image,
      'descriptionEN':descriptionEN,
      'descriptionAR':descriptionAR,
      'color':color,
      'Sized':Sized,
      'price':price,
      'sub_description':sub_description,
      'productId':productId,
      'type':type
    };


}}