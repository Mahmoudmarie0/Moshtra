

import 'package:flutter/cupertino.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';

class SmartWatchesModel{
  String ?name,image ,price,sub_description,description,Sized,watchId;
Color? color;

  SmartWatchesModel({
    this.name,
    this.image,
    this.price,
    this.description,
    this.color,
    this.Sized,
    this.sub_description,
   this.watchId
  });


  SmartWatchesModel.fromJson(Map<dynamic,dynamic>map){
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
    watchId=map['watchId'];
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
      'watchId':watchId
    };

  }}