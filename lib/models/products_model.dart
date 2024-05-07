

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class ProductModel{
  String ?nameAR,nameEN,image ,descriptionAR,descriptionEN,Sized,price,sub_descriptionAR,sub_descriptionEN,productId,type;
  Color? color;

  ProductModel({
      this.nameAR,
      this.nameEN,
      this.image,
      this.descriptionAR,
      this.descriptionEN,
      this.color,
      this.Sized,
      this.price,
      this.sub_descriptionEN,
      this.sub_descriptionAR,
      this.productId,
      this.type
  });


  ProductModel.fromJson(Map<dynamic,dynamic>map){
    nameAR=map['nameAR'];
    nameEN=map['nameEN'];
    image=map['image'];
    descriptionEN=map['descriptionEN'];
    descriptionAR=map['descriptionAR'];
    color= HexColor.fromHex(map['color']);
    Sized=map['Sized'];
    price=map['price'];
    sub_descriptionEN=map['sub_descriptionEN'];
    sub_descriptionAR=map['sub_descriptionAR'];
    productId=map['productId'];
    type=map['type'];
  }
  ProductModel.fromSnapshot(snapshot)
      :productId = snapshot['productId'],
        nameAR = snapshot['nameAR'],
        nameEN = snapshot['nameEN'],
        image = snapshot['image'],
        descriptionEN = snapshot['descriptionEN'],
        descriptionAR = snapshot['descriptionAR'],
        Sized = snapshot['Sized'],
        price = snapshot['price'],
        type = snapshot['type'],
        sub_descriptionEN = snapshot['sub_descriptionEN'],
        sub_descriptionAR = snapshot['sub_descriptionAR'],
        color = HexColor.fromHex(snapshot['color']);


  toJson(){
    return{
      'nameAR':nameAR,
      'nameEN':nameEN,
      'image':image,
      'descriptionEN':descriptionEN,
      'descriptionAR':descriptionAR,
      'color': '#${color!.value.toRadixString(16).substring(2)}',
      'Sized':Sized,
      'price':price,
      'sub_descriptionEN':sub_descriptionEN,
      'sub_descriptionAR':sub_descriptionAR,
      'productId':productId,
      'type':type
    };


}}