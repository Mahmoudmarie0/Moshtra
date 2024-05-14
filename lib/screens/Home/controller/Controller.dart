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

  List<ProductModel> get forYouProductModel => _forYouProductModel;
  List<ProductModel> _forYouProductModel = [];



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
    SuggestedForYou();
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
    forYouProductModel.clear();
    categoryModel.clear();
    bannerModel.clear();
    await getCategory();
    await getBanners();
    await getBestSellingProducts();
    await SuggestedForYou();


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

  SuggestedForYou()
  async {
    int Phones=0, Labtops=0, Smart_watches=0, camera=0, Electronic=0, Furniture=0, Electrical_appliances=0, Clothes=0, Supermarket=0, Kids_Games=0, Sports=0;


    Map<String, int> itemCounts = {
      'Phones': Phones,
      'Labtops': Labtops,
      'Smart watches': Smart_watches,
      'camera': camera,
      'Electronic': Electronic,
      'Furniture': Furniture,
      'Electrical appliances': Electrical_appliances,
      'Clothes': Clothes,
      'Supermarket': Supermarket,
      'Kids Games': Kids_Games,
      'Sports': Sports,
    };
    var sortedEntries ;

    _loading.value = true;

    final  histquery = await FirebaseFirestore.instance
        .collection('User_history').where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    for(int i=0; i<histquery.docs.length; i++){
      switch (histquery.docs[i]['product']['type']){
        case 'Phones':
          itemCounts['Phones'] = (itemCounts['Phones'] ?? 0) + 1;
          break;
        case 'Labtops':
          itemCounts['Labtops'] = (itemCounts['Labtops'] ?? 0) + 1;
          break;
        case 'Smart watches':
          itemCounts['Smart watches'] = (itemCounts['Smart watches'] ?? 0) + 1;
          break;
        case 'camera':
          itemCounts['camera'] = (itemCounts['camera'] ?? 0) + 1;
          break;
        case 'Electronic':
        case 'Generic':
        case 'Speakerphone':
        case 'GeForce RTX':
        case 'Storage device':
        case 'Remote control':
        case 'Printer':
        case 'Phone Holder':
        case 'Mouses':
          itemCounts['Electronic'] = (itemCounts['Electronic'] ?? 0) + 1;
          break;
        case 'Furniture':
          itemCounts['Furniture'] = (itemCounts['Furniture'] ?? 0) + 1;
          break;
        case 'Electrical appliances':
          itemCounts['Electrical appliances'] = (itemCounts['Electrical appliances'] ?? 0) + 1;
          break;
        case 'Clothes':
          itemCounts['Clothes'] = (itemCounts['Clothes'] ?? 0) + 1;
          break;
        case 'Supermarket':
          itemCounts['Supermarket'] = (itemCounts['Supermarket'] ?? 0) + 1;
          break;
        case 'Kids Games':
          itemCounts['Kids Games'] = (itemCounts['Kids Games'] ?? 0) + 1;
          break;
        case 'Sports':
          itemCounts['Sports'] = (itemCounts['Sports'] ?? 0) + 1;
          break;
        default:
          break;
      }
      sortedEntries = itemCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

    }

    // print(itemCounts);
    // print(sortedEntries[0]);
    // print(sortedEntries[1]);
    // print(sortedEntries[0].key);
    // print(sortedEntries[1].key);


    String firstMax = sortedEntries[0].key;
    String secondtMax = sortedEntries[1].key;
    List<ProductModel> A = [];
    List<ProductModel> B = [];



    String categotyName1 = getCatName(firstMax);
    String categotyName2 = getCatName(secondtMax);


    if(_forYouProductModel.isEmpty)
    {
      if (sortedEntries[0].value > 0){

        if(A.isEmpty)
        {
          _loading.value = true;

          final QuerySnapshot<Map<String, dynamic>> categoryQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .where('nameEN', isEqualTo: categotyName1).get();

          DocumentReference catRef = FirebaseFirestore.instance
              .collection('Categories').doc(categoryQuery.docs[0].id);

          final QuerySnapshot<Map<String, dynamic>> productQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .doc(catRef.id).collection('Products')
              .where('type', isEqualTo: firstMax).get();

          final forYouProducts = productQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
          A = forYouProducts;

          _loading.value = false;
        }
        update();
        _forYouProductModel.addAll(A);
      }

      if(sortedEntries[1].value > 0) {
        if(B.isEmpty)
        {
          _loading.value = true;

          final QuerySnapshot<Map<String, dynamic>> categoryQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .where('nameEN', isEqualTo: categotyName2).get();

          DocumentReference catRef = FirebaseFirestore.instance
              .collection('Categories').doc(categoryQuery.docs[0].id);


          final QuerySnapshot<Map<String, dynamic>> productQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .doc(catRef.id).collection('Products')
              .where('type', isEqualTo: secondtMax).get();

          final forYouProducts = productQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
          B = forYouProducts;

          _loading.value = false;
        }
        update();
        _forYouProductModel.addAll(B);
      }

    }

    _forYouProductModel.shuffle();



  }
  String getCatName(String type)
  {
    String categotyName = '';
    if ( type == 'Phones' || type == 'Labtops' || type == 'Smart watches' || type == 'camera' ||
        type == 'Generic' || type == 'Speakerphone'|| type == 'GeForce RTX' || type == 'Storage device' ||
        type == 'Remote control' || type == 'Printer' || type == 'Phone Holder' || type == 'Mouses')

      categotyName = 'Electronic';
    else
      categotyName = type;

    return categotyName;
  }





}
