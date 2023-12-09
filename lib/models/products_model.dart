

import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class ProductModel{
  String ?name,image ,description,Sized,price;
  Color? color;

  ProductModel({
      this.name,
      this.image,
      this.description,
      this.color,
      this.Sized,
      this.price});


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
  }

  toJson(){
    return{
      'name':name,
      'image':image,
      'description':description,
      'color':color,
      'Sized':Sized,
      'price':price,
    };

}}