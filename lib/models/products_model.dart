

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
    if(map==null){
      return;
    }
   name=map['name'];
    image=map['image'];
    description=map['description'];
    color= HexColor.fromHex(map['color']);
    Sized=map['Sized'];
    price=map['price'];
    sub_description=map['sub_description'];
    productId=map['productId'];
  }

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