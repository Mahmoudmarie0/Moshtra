

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class ProductModel{
  String ?name,image ,description,Sized,price,sub_description,productId;
  Color? color;

  ProductModel({
      this.name,
      this.image,
      this.description,
      this.color,
      this.Sized,
      this.price,
      this.sub_description,
      this.productId
  });


  ProductModel.fromJson(Map<dynamic,dynamic>map){
    name=map['name'];
    image=map['image'];
    description=map['description'];
    color= HexColor.fromHex(map['color']);
    Sized=map['Sized'];
    price=map['price'];
    sub_description=map['sub_description'];
    productId=map['productId'];
  }
  ProductModel.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :productId = snapshot.id,
        name = snapshot['name'],
        image = snapshot['image'],
        description = snapshot['description'],
        Sized = snapshot['Sized'],
        price = snapshot['price'],
        sub_description = snapshot['sub_description'],
        color = HexColor.fromHex(snapshot['color']);

  toJson(){
    return{
      'name':name,
      'image':image,
      'description':description,
      'color':color,
      'Sized':Sized,
      'price':price,
      'sub_description':sub_description,
      'productId':productId
    };


}}