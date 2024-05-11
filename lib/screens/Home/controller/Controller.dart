import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:moshtra/models/banner_model.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/service/home_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/category_model.dart';
import '../../../models/user_history_model.dart';

class HomeController extends GetxController {

  CollectionReference User_history = FirebaseFirestore.instance.collection('User_history');

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);


  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

//get method to retutn list _categoryModel
  List<user_history> get histModel => _histModel;
  List<user_history> _histModel = [];

  List<ProductModel> get histProducts => _histProducts;
  List<ProductModel> _histProducts = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  final TextEditingController SearchController = TextEditingController();

  List<BannerModel> get bannerModel => _bannerModel;
  List<BannerModel> _bannerModel = [];

  RefreshController refreshController = RefreshController();
  ScrollController scrollController = ScrollController();

  HomeController() {
    getCategory();
    getBestSellingProducts();
    getBanners();
    gethistory();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));

        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      //print(_productModel.length);
      update();
    });
  }

  getBanners() async {
    _loading.value = true;
    HomeService().getBanners().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bannerModel.add(BannerModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      print(_bannerModel.length);
      print("hi");
      update();
    });
  }



  onRefresh() async {
    productModel.clear();
    categoryModel.clear();
    bannerModel.clear();
    await getCategory();
    await getBanners();
    await getBestSellingProducts();


  }

 //  Future refresh() async {
 // //   await HomeService().getCategory();
 //    _productModel.clear();
 //    await getBestSellingProducts();
 //   // await HomeService().getBanners();
 //    update();
 //  }


  gethistory() async{
    _loading.value = true;
    final  histquery = await FirebaseFirestore.instance
        .collection('User_history').where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

    for(int i = 0 ; i < histquery.docs.length ; i++){
        _histModel.add(user_history.fromSnapshot(histquery.docs[i]));
        _histProducts.add(ProductModel.fromSnapshot(histquery.docs[i]['product']));
      
    }
    print('44444444444');
    print(_histProducts.length);
    print(_histModel.length);
    _loading.value = false;
    update();
  }



  addHistory(product)
  async {

    final  histquery = await FirebaseFirestore.instance
        .collection('User_history').where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

    for(int i=0; i<histquery.docs.length; i++){
      if(histquery.docs[i]['product']['productId'] == product.productId)
      {
        DocumentReference docRef = FirebaseFirestore.instance
            .collection('User_history').doc(histquery.docs[i].id);
        await docRef.update({'createdAt': DateTime.now()});
        print('update date');
        return;
      }
    }

    User_history.add({
      'product':
      product.toJson(),
      'createdAt': DateTime.now(),
      'userId': FirebaseAuth
          .instance.currentUser!.uid
          .toString()
    });
    print('success');
    update();



  }



}
