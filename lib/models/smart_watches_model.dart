

import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class SmartWatchesModel{
  String ?name,image ,price,productId;


  SmartWatchesModel({
    this.name,
    this.image,
    this.price,
    this.productId
  });


  SmartWatchesModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    price=map['price'];

    productId=map['productId'];
  }

  toJson(){
    return{
      'name':name,
      'image':image,
      'price':price,
      'productId':productId
    };

  }}