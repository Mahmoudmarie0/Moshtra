






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:moshtra/models/banner_model.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/service/home_service.dart';


import '../../../models/category_model.dart';





class HomeController extends GetxController{



  ValueNotifier<bool>get loading=>_loading;
ValueNotifier<bool>_loading=ValueNotifier(false);

  List <CategoryModel> get categoryModel=>_categoryModel;
List <CategoryModel> _categoryModel=[];


  List <ProductModel> get productModel=>_productModel;
  List <ProductModel> _productModel=[];


  List <BannerModel> get bannerModel =>_bannerModel;
  List <BannerModel> _bannerModel=[];



HomeController(){
  getCategory();
  getBestSellingProducts();
  getBanners();
}


getCategory()async{
  _loading.value=true;
  HomeService().getCategory().then((value) {
    for(int i=0;i<value.length;i++){
      _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));

      _loading.value=false;
    }
    update();

  });

}


getBestSellingProducts()async{
  _loading.value=true;
  HomeService().getBestSelling().then((value) {
    for(int i=0;i<value.length;i++){
      _productModel.add(ProductModel.fromJson(value[i].data() as Map));
      _loading.value=false;
    }
    //print(_productModel.length);
    update();
  });
}

  getBanners() async{
    _loading.value=true;
     HomeService().getBanners().then((value) {
       for(int i=0;i<value.length;i++){
         _bannerModel.add(BannerModel.fromJson(value[i].data() as Map));
         _loading.value=false;
       }
       print(_bannerModel.length);
       print("hi");
       update();
     });

  }
}

